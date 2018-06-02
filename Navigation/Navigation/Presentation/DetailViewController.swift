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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(carName != nil)
        {
            print("Car Name is ",carName!)
            viewControllerLabel.text = "This is " + carName!
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var viewControllerLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
