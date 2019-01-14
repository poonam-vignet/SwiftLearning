//
//  ViewController.swift
//  FirebaseAuthentication
//
//  Created by Poonam Bhadikar on 29/07/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var emaidId = "poonambhadikar2009.com";
        var password = "password1235"
        Auth.auth().createUser(withEmail: emaidId, password: password) { (user,error) in
            if(error == nil)
            {
                print("Error in creating new user");
            }
            else{
                print("New user is created")
            }
            
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

