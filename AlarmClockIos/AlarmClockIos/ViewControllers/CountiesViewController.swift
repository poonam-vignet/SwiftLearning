//
//  CountiesViewController.swift
//  AlarmClockIos
//
//  Created by Poonam Bhadikar on 14/08/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit


class CountiesViewController: UIViewController,UITableViewDataSource,UISearchBarDelegate,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var arrayOfList = TimeZone.knownTimeZoneIdentifiers;
    var searchActive : Bool = false
    var data = ["India","New York","San Jose","Chicago","Spain","Austin","India","New York","San Jose","Chicago","Spain","Austin"]
    var filtered:[String] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        data = arrayOfList;
      //  tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
//        tableView.re
//        tableView.register(nil, forCellReuseIdentifier: "Cell")
        
        
        // Do any additional setup after loading the view.
    }

   
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    internal func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell;
        cell.textLabel?.textColor = UIColor.white;
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row];
        }
        
        return cell;
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedZoneCell = tableView.cellForRow(at: indexPath) as! UITableViewCell;
        let selectedZoneName = selectedZoneCell.textLabel?.text;
        let  seletctedTZ:TimeZone = TimeZone(identifier: selectedZoneName!)!
        
        let dateFormatter = DateFormatter()
       //dateFormatter.dateFormat = "dd:MM:yyy hh:mm:ss"
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.timeZone = seletctedTZ
        dateFormatter.string(from: Date())
        print("Time of selected zone \(seletctedTZ) is",dateFormatter.string(from: Date()))
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeController = storyBoard.instantiateViewController(withIdentifier: "HomeScreenController") as! HomeScreenController
        let worldClock = (homeController.viewControllers![0]).childViewControllers[0] as! WorldClockViewController ;
    
        
        var clockObject:Clock = Clock();
        clockObject.completeTime = dateFormatter.string(from: Date());
        clockObject.shortTime = dateFormatter.string(from: Date());
        clockObject.zonename = String(describing: seletctedTZ);
        
        
        WorldClockViewController.listOfClocks.append(clockObject)
//       WorldClockViewController.listOfClock.append(dateFormatter.string(from: Date()))
    
        
        self.present(homeController, animated: true, completion: nil)
       // self.navigationController?.popToRootViewController(animated: true);
        //WorldClockViewController
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
