//
//  HomeTableViewController.swift
//  Navigation
//
//  Created by Poonam Bhadikar on 13/05/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var cars:Array<String> = Array();
    var carsImages:Array<String> = Array();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars.insert("Audi", at: 0)
        cars.insert("bmw", at: 1)
        cars.insert("Mercedes", at: 2)
        cars.insert("Rangerover", at: 3)
        cars.insert("Fortuner", at: 4)

        
        carsImages.insert("audi", at: 0)
        carsImages.insert("bmw", at: 1)
        carsImages.insert("mercedes", at: 2)
        carsImages.insert("rangerover", at: 3)
        carsImages.insert("fortuner", at: 4)


        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        tableView.rowHeight =  UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        
        self.tableView.register(UINib(nibName:"CustomCell",bundle:nil), forCellReuseIdentifier: "CustomCellIdentifier")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count;
    }
    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
{
    //index path maintains row and section path
    //  case value1 // Left aligned label on left and right aligned label on right with blue text (Used in Settings)
    
    
//      let price = 1000000 ;
//       let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "CustomeCellTableViewCell")
//      cell.textLabel?.text = cars[indexPath.row]
//        cell.detailTextLabel?.text = "\(price + indexPath.row + 1) Rs";
//  return cell
    let cutomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier", for: indexPath) as!CustomCell

    cutomCell.carimage.image = UIImage(named: carsImages[indexPath.row])
    cutomCell.carNameValueLabel.text = cars[indexPath.row]
    cutomCell.carNameLabel.isHidden = true;
    return cutomCell;
    
    
    
}
    
    
    
    // Navigation to detail view controller on click of row
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        destinationVC?.carName = cars[indexPath.row]
        destinationVC?.title = "Details"
        self.navigationController?.pushViewController(destinationVC!, animated: true)
        
        //self.performSegue(withIdentifier: "detailViewSegue", sender: nil)
    }
    
    //Before segue results in navition from home view controller to detail view controller
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as? DetailViewController
//        let sourceVC = segue.source as? HomeTableViewController
//        let cell = sender as? CustomCell
//        let indexPath = self.tableView.indexPath(for: cell!)
//        destinationVC?.carName = cars[(indexPath?.row)!]
//        print("Inside prepare method")
//    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 150.0;
//    }
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
