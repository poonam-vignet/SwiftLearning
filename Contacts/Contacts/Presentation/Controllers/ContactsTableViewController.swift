//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Poonam Bhadikar on 06/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var contactDictionar : Dictionary<Character,[Contacts]> = Dictionary<Character,[Contacts]>();
    var numberOfRowsInsection = 0
    
    var selectedSection:Int? = -1
    var selectedSectionCell :  InitialsTableViewCell?

    

    override func viewDidLoad() {
        super.viewDidLoad()
       fillDictionary()
        tableView.register(UINib(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactCustomCell")
        
        tableView.register(UINib(nibName: "InitialsTableViewCell", bundle: nil), forCellReuseIdentifier: "InitialsTableViewCell")
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contactDictionar.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(selectedSectionCell?.tag == section && (selectedSectionCell?.collapsed)!)
        {
            return  0;
            
        }
        
        
        let key = Array(contactDictionar.keys).sorted()[section]
        let contactsArray = contactDictionar[key]
        
        
        
        return (contactsArray?.count)!;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let key = Array(contactDictionar.keys).sorted()[indexPath.section]
        let array = contactDictionar[key] as! [Contacts]
        
        var contactCell : ContactsTableViewCell
//        if((indexPath.row == 0)) // Section
//        {
//            var initialsCell : InitialsTableViewCell
//
//            initialsCell  =  tableView.dequeueReusableCell(withIdentifier: "InitialsTableViewCell", for: indexPath) as! InitialsTableViewCell
//
//            initialsCell.initialsLabel.text = String(key)
//            return initialsCell
//
//        }
        
        contactCell  =  tableView.dequeueReusableCell(withIdentifier: "ContactCustomCell", for: indexPath) as! ContactsTableViewCell
        
        contactCell.contactImage.layer.masksToBounds = true
        contactCell.contactImage.layer.cornerRadius = 22;
        contactCell.contactImage.image = UIImage(named : "Akash")
        
        
        
//        if(indexPath.row > 0) // as first row is section
//        {
        contactCell.ContactName.text = array[indexPath.row].name // Need to -1 as array index starts from 0
        contactCell.workingPlace.text = array[indexPath.row].workLocation
       // }
        
        
        
        return contactCell
        
    }
    var nameField: UITextField?
    var workLocation: UITextField?
    
    @IBAction func AddButtonClicked(_ sender: UIBarButtonItem)
    {
        
        
        
    let alert = UIAlertController(title: "Enter contact", message: "Please enter contact details", preferredStyle: .alert)
        let addAlertAction = UIAlertAction(title: "ADD", style:.default)
        {
            [unowned self] action in
            
            guard let nameTextField = alert.textFields?.first
                else{
                    return
            }
            
            
            
            guard let nameToSave = nameTextField.text else{

                return
            }

            guard let workTextField = alert.textFields?[1],
                let workPlaceToSave = workTextField.text
             else
            {
                return
            }
            
            let key :Character = nameToSave[nameToSave.startIndex]
            let uppercaseKey = Character(String(key).uppercased())

            self.addToDictonary(key: uppercaseKey,name: nameToSave,place: workPlaceToSave)
            self.tableView.reloadData()
           
        }
        
        alert.addAction(addAlertAction)
        
        
        alert.addTextField { (nameTextField) in
            nameTextField.placeholder = "First Name"
            nameTextField.textAlignment = .left
        }
        
        alert.addTextField { (workTextField) in
            workTextField.placeholder = "Work Place"
            workTextField.textAlignment = .left
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func fillDictionary()
    {
        let contact:Contacts = Contacts()
        contact.name = "Amar"
        contact.workLocation = "Mumbai"
        contactDictionar["A"] = [contact]
        
        
        let contact11:Contacts = Contacts()
        contact11.name = "Amar1"
        contact11.workLocation = "Mumbai1"
        contactDictionar["A"]?.append(contact11)
       
//        let contact1:Contacts = Contacts()
//        contact1.name = "Bob"
//        contact1.workLocation = "New York"
//        contactDictionar["B"] = [contact1]
//
//        let contact2:Contacts = Contacts()
//        contact2.name = "Bob1"
//        contact2.workLocation = "New York1"
//        contactDictionar["B"]?.append(contact2)
        
    
        
        let contactC:Contacts = Contacts()
        contactC.name = "Chetan"
        contactC.workLocation = "New York"
        contactDictionar["C"] = [contactC]
        
        let contactC1:Contacts = Contacts()
        contactC1.name = "Chetan1"
        contactC1.workLocation = "New York1"
        contactDictionar["C"]?.append(contactC1)
       
        let contactC2:Contacts = Contacts()
        contactC2.name = "Chetan2"
        contactC2.workLocation = "New York1"
        contactDictionar["C"] = [contactC]

        contactDictionar["C"]?.append(contactC2)
        
        let contactC4:Contacts = Contacts()
        contactC4.name = "Chetan"
        contactC4.workLocation = "New York"
        contactDictionar["K"] = [contactC4]

        
        let contactC5:Contacts = Contacts()
        contactC5.name = "Chetan"
        contactC5.workLocation = "New York"
        contactDictionar["L"] = [contactC5]

        
        

        
    }
    
    func addToDictonary(key : Character?,name:String?,place : String?) -> ()
    {
        
        var contactTobeAdded :Contacts = Contacts()
        contactTobeAdded.name = name
        contactTobeAdded.workLocation = place
        
        
        if(  contactDictionar.keys.contains(key!))
        {
            var contactArray = contactDictionar[key!]
            contactArray?.append(contactTobeAdded)
            contactDictionar[key!] = contactArray


        }
        else{
            contactDictionar[key!] = [contactTobeAdded]

        }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath)
        
        if(cell != nil)
        {
            return (cell?.frame.height)!
        }
        
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if(indexPath.row == 0)
//        {
//            numberOfRowsInsection = 2;
//            tableView.reloadData()
//
//        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let key = Array(contactDictionar.keys).sorted()[section]
        
        var initialsCell : InitialsTableViewCell
        
        initialsCell  =  tableView.dequeueReusableCell(withIdentifier: "InitialsTableViewCell") as! InitialsTableViewCell
        
        initialsCell.initialsLabel.text = String(key)
        let headerTapGesture = UITapGestureRecognizer()

        headerTapGesture.addTarget(self, action: #selector(self.sectionHeaderWasTouched(_:)))
        
        initialsCell.contentView.addGestureRecognizer(headerTapGesture)
        
        initialsCell.collapsed = false;
        
       
        initialsCell.contentView.tag = section

        
        return initialsCell.contentView;
        
    }
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer)
    {
//        var headerView = sender.view
//        selectedSection = headerView?.tag
//        tableView.reloadData()
//
//        guard let cell = sender.view?.superview as? InitialsTableViewCell else {
//            return
//        }
//        cell.collapsed = !cell.collapsed!
//        selectedSectionCell = cell

    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
