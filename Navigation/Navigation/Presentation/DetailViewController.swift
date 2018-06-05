//
//  DetailViewController.swift
//  Navigation
//
//  Created by Poonam Bhadikar on 02/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var carName : String?
    var carImage : String?
    var price : Int?
    var litersOrType : String?
    var colorOfCar :String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Features"
        if(carName != nil)
        {
            print("Car Name : ",carName!)
            viewControllerLabel.text = "Car Name : " + carName!
        }
        if(price != nil)
        {
            carPriceLabel.text = "Car Price: \(price!)"
        }
        if(colorOfCar != nil)
        {
            colorOfCarLabel.text = "Color: \(colorOfCar!)"
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var viewControllerLabel: UILabel!
    
    @IBOutlet weak var carPriceLabel: UILabel!
    @IBOutlet weak var colorOfCarLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
