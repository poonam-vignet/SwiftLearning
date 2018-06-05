//
//  CarsArrayOfObjectTableViewController.swift
//  Navigation
//
//  Created by Poonam Bhadikar on 02/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class CarsArrayOfObjectTableViewController: UITableViewController {
    
    //Create dictionary
    var carsArray : Array<Cars> = Array<Cars>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArray();
        tableView.register(UINib(nibName :"CustomCell",bundle:nil),
                           forCellReuseIdentifier:"CustomCellIdentifier")
        
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carsArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func fillArray()
    {
        let car1 = Cars();
        let car2 = Cars();
        let car3 = Cars();
        let car4 = Cars();
        let car5 = Cars();
        
        car1.carName = "AUDI"
        car2.carName = "BMW"
        car3.carName = "MERCEDES"
        car4.carName = "RANGEROVER"
        car5.carName = "FORTUNER"
        
        car1.carImage = "audi";
        car2.carImage = "bmw";
        car3.carImage = "mercedes";
        car4.carImage = "rangerover";
        car5.carImage = "fortuner";
        
        
        car1.price = 5506000;
        car2.price = 3400000;
        car3.price = 3000000;
        car4.price = 4400000;
        car5.price = 2600000;
        
        
        car1.colorOfCar = "Black"
        car2.colorOfCar = "White"
        car3.colorOfCar = "White"
        car4.colorOfCar = "Black"
        car5.colorOfCar = "Brown"
        
        carsArray.append(car1)
        carsArray.append(car2)
        carsArray.append(car3)
        carsArray.append(car4)
        carsArray.append(car5)
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier", for: indexPath) as? CustomCell
        
        cell?.carNameValueLabel.text = (carsArray[indexPath.row] as Cars).carName;
        cell?.carimage.image = UIImage(named:(carsArray[indexPath.row] as Cars).carImage!)
        cell?.carNameLabel.isHidden = true
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let  detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        {
            detailVC.carName = (carsArray[indexPath.row]).carName
            detailVC.price = (carsArray[indexPath.row]).price
            detailVC.colorOfCar = (carsArray[indexPath.row]).colorOfCar
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
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
