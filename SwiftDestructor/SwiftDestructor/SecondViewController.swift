//
//  SecondViewController.swift
//  SwiftDestructor
//
//  Created by Poonam Bhadikar on 16/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    deinit {
        print("deinit",self.description)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        let mainStoryBoard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = mainStoryBoard.instantiateViewController(withIdentifier: "InitialViewController")
        UIApplication.shared.keyWindow?.rootViewController = initialViewController
        
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
