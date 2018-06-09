//
//  ViewController.swift
//  ToDoLIst
//
//  Created by Poonam Bhadikar on 02/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit
import CoreData

//We have used view controller and added table view
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var list : [NSManagedObject] = []
    
    lazy  var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.blue
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refeshControl :UIRefreshControl)
    {
        
        self.fetchData()
        self.uiTableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    func fetchData()
    {
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "List")
        do{
            
            list = (try managedContext?.fetch(fetchRequest))!
        }
        catch let error as NSError
        {
            print("could not fetch:  \(error),\(error.userInfo)")
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let record = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = record.value(forKeyPath: "name") as? String
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? // this is optional , we can have on row actions
    {
        //Action one
        
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: {
            (action,indexPath) in
            print("Edit Tapped")
            self.editRecord(indexPath: indexPath)
            
        })
        editAction.backgroundColor = UIColor.blue
        
        //Action two
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler:{
            (action,indexPath) in
            print("Delete Tapped")
            self.deleteRecord(indexPath: indexPath)
            
        })
        deleteAction.backgroundColor = UIColor.red
        return [editAction,deleteAction]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The List"
        //2nd way of regstering cell.
        uiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        uiTableView.refreshControl = refreshControl;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Action for add button
    @IBAction func rightBarButtonClicked(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add", message: "Add new Item", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let recordToSave = textField.text else
            {
                return
            }
            self.save(name: recordToSave)
            self.uiTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true)
        
    }
    
    func save(name:String)
    {
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "List", in: managedContext!)
        let record = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        record.setValue(name,forKeyPath: "name") // name is name of attribute
        do{
            try managedContext?.save()
            list.append(record)
        }catch let error as NSError
        {
            print("could not fetch:  \(error),\(error.userInfo)")
        }
    }
    
    func editRecord(indexPath :IndexPath)
    {
        
        let record = list[indexPath.row]
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let alert = UIAlertController(title: "Edit", message: "Edit", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let recordToSave = textField.text else
            {
                return
            }
            record.setValue(recordToSave, forKeyPath: "name")
            do
            {
                try managedContext?.save()
            }
            catch let error as NSError
            {
                print("could not fetch:  \(error),\(error.userInfo)")
            }
            
            self.uiTableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        alert.textFields?.first?.text = record.value(forKeyPath: "name") as? String
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    
    func deleteRecord(indexPath :IndexPath)
    {
        let record = list[indexPath.row]
        let managedContext = appDelegate?.persistentContainer.viewContext
        let alert = UIAlertController(title: "Delete", message: "Delete item \(record.value(forKeyPath: "name") as! String)", preferredStyle:.alert)
        let saveAction = UIAlertAction(title: "Delete", style:.default)
        {[unowned self] action in
            do{
                managedContext?.delete(record)
                try managedContext?.save()
                
            }catch let error as NSError
            {
                print("could not fetch:  \(error),\(error.userInfo)")
            }
            self.fetchData()
            self.uiTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
        
    }
    
    
    @IBOutlet weak var uiTableView: UITableView!
    
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
}

