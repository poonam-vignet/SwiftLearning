//
//  WorldClockViewController.swift
//  AlarmClockIos
//
//  Created by Poonam Bhadikar on 04/08/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class WorldClockViewController: UITableViewController {
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
        return 4;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell();
        if((indexPath.row%2)==0)
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as! AlarmTableViewCell
        }
            
            
        else
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "SpaceTableViewCell", for: indexPath) as! SpaceTableViewCell
            
        }
        return cell;
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if((indexPath.row%2)==0)
        {
            return 60;
        }
        else
        {
            return 10;
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
