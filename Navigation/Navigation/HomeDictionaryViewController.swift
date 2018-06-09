//
//  HomeDictionaryViewController.swift
//  Navigation
//
//  Created by Poonam Bhadikar on 02/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class HomeDictionaryViewController: UITableViewController {
    
    
    //Create dictionary
    var carsDictionary : Dictionary<Int,Cars> = Dictionary<Int,Cars>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillDictionary();
        tableView.register(UINib(nibName: "CustomCell",bundle:nil) , forCellReuseIdentifier: "CustomCellIdentifier")
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillDictionary()
    {
        let car1 = Cars();
        let car2 = Cars();
        let car3 = Cars();
        let car4 = Cars();
        let car5 = Cars();
        
        
        car1.carName = "AUDI";
        car2.carName = "BMW";
        car3.carName = "MERCEDES";
        car4.carName = "RANGEROVER";
        car5.carName = "FORTUNER";
        
        
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
        
        
        carsDictionary[0] = car1
        carsDictionary[1] = car2
        carsDictionary[2] = car3
        carsDictionary[3] = car4
        carsDictionary[4] = car5
        
        
    }
    //return number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //return number of rows as dictionary element
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsDictionary.count
    }
    
    // propogate rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let customeCarcell = tableView.dequeueReusableCell(withIdentifier: "CustomCellIdentifier", for: indexPath) as? CustomCell
        
        customeCarcell?.carNameValueLabel.text  = carsDictionary[indexPath.row]?.carName
        customeCarcell?.carimage.image = UIImage(named :(carsDictionary[indexPath.row]?.carImage)!)
        customeCarcell?.carNameLabel.isHidden = true
        
        return customeCarcell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let  detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        {
            detailVC.carName = (carsDictionary[indexPath.row])?.carName
            detailVC.price = (carsDictionary[indexPath.row])?.price
            detailVC.colorOfCar = (carsDictionary[indexPath.row])?.colorOfCar
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
    
    //row selected 
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

