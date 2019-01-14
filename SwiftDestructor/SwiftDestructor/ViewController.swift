//
//  ViewController.swift
//  SwiftDestructor
//
//  Created by Poonam Bhadikar on 16/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    deinit {
        print("deinit",self.description)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonClicked(_ sender: Any) {
        
        let mainStoryBoard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SecondViewController")
        UIApplication.shared.keyWindow?.rootViewController = secondViewController
    }
    
}

