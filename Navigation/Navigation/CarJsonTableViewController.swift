//
//  CarJsonTableViewController.swift
//  Navigation
//
//  Created by Poonam Bhadikar on 08/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class CarJsonTableViewController: UITableViewController {
    var carsArray : Array<Cars> = Array<Cars>();

    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.register(UINib(nibName: "CustomCell",bundle:nil) , forCellReuseIdentifier: "CustomCellIdentifier")
        
        if let path = Bundle.main.path(forResource: "Cars", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let CarsDictionary : [NSDictionary] = jsonResult["Cars"] as? [NSDictionary] {
                        
                        for car: NSDictionary in CarsDictionary {
                            let car1 = Cars()

                            for (name,value) in car {
                                car1.carName = car["name"] as? String
                                car1.colorOfCar = car["Color"] as? String
                                let stringPrice:String = ((car["Price"]) as? String)!
                                car1.price = Int(stringPrice)
                                car1.carImage = car["carImage"] as? String
                                
                                print("\(name) , \(value)")
                            }
                            carsArray.append(car1)

                        }
                    }
                } catch {}
            } catch {}
        }
        
        
        
//        if let path = Bundle.main.path(forResource: "Cars", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let car = jsonResult["Cars"] as? [Any] {
//
//
//                    if let firstObject = car.first {
//                        firstObject.value(forKeyPath: "name") as? String
//                    }
//
//
//                   // var name = ([car as Array][0]).name;
//                   // print(name)
//                    // do stuff
//                }
//            } catch {
//                // handle error
//            }
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //return number of rows as dictionary element
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsArray.count
    }
    
    // propogate rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let customeCarcell = tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier", for: indexPath) as? CustomCell
        
        customeCarcell?.carNameValueLabel.text  = carsArray[indexPath.row].carName
        customeCarcell?.carimage.image = UIImage(named :(carsArray[indexPath.row].carImage)!)
        customeCarcell?.carNameLabel.isHidden = true
        
        return customeCarcell!
        
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
