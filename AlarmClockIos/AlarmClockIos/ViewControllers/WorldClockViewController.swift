//
//  WorldClockViewController.swift
//  AlarmClockIos
//
//  Created by Poonam Bhadikar on 04/08/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class WorldClockViewController: UITableViewController {
    static var listOfClocks:[Clock] = [];

    public var listOfClock:[String] = [];
    static var count:Int = 0;
    
    @IBAction func EditClicked(_ sender: Any) {
    }
    
    @IBAction func AddClicked(_ sender: Any) {
        
        let storyBoard :UIStoryboard = UIStoryboard(name: "County", bundle: nil)
        let countryScreen = storyBoard.instantiateViewController(withIdentifier: "CountiesViewController")
        self.present(countryScreen, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "AlarmTableViewCell")
        tableView.register(UINib(nibName: "SpaceTableViewCell", bundle: nil), forCellReuseIdentifier: "SpaceTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //We need to add blank screen alternatively hence make number of rows as double of list of clocks
        return WorldClockViewController.listOfClocks.count + WorldClockViewController.listOfClocks.count;
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell();
        
        if((indexPath.row%2)==0)
        {
            let cell1:AlarmTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as! AlarmTableViewCell
            
            var clockItem = WorldClockViewController.listOfClocks[WorldClockViewController.count]
            cell1.ClockTime.text =  (WorldClockViewController.listOfClocks.count==0 ?  "": clockItem.completeTime)
            cell1.ZoneNAme.text = (WorldClockViewController.listOfClocks.count==0 ?  "": clockItem.zonename)
            cell = cell1;
            
            
            WorldClockViewController.count = WorldClockViewController.count + 1
            if(WorldClockViewController.count == WorldClockViewController.listOfClocks.count)
            {
                WorldClockViewController.count = 0;
            }
            
        }
            
        else
        {
            //Add blank cell alternatively
            cell = tableView.dequeueReusableCell(withIdentifier: "SpaceTableViewCell", for: indexPath) as! SpaceTableViewCell
            
        }
        return cell;
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if((indexPath.row%2)==0)
        {
            // alarm clock cell
            return 60;
        }
        else
        {
            // Blank cell
            return 10;
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete)
        {
            
        //We are having balank cell alternatively . hence divide by 2
          WorldClockViewController.listOfClocks.remove(at:indexPath.row/2 )
            
            tableView.reloadData();
        }
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
