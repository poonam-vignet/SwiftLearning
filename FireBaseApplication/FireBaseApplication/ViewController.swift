//
//  ViewController.swift
//  FireBaseApplication
//
//  Created by Poonam Bhadikar on 15/07/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
            var emailId = "poonambhadikar11@gmail.com";
            var password = "password1235"
        
       // UserAuthentication.CreateNewUser(userEmailID: emailId, password: password)
        UserAuthentication.Login(userEmailID: emailId, password: password)


        
      //self.ref.child("users").child(user.uid).setValue(["username": "Poonam"])

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

