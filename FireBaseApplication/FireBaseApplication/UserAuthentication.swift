//
//  UserAuthentication.swift
//  FireBaseApplication
//
//  Created by Poonam Bhadikar on 28/07/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class UserAuthentication {
    

    //Create new user
    class func CreateNewUser(userEmailID:String,password:String)
    {
        Auth.auth().createUser(withEmail: userEmailID, password: password) { (user,error) in
            if(error == nil) {
                
                print("New user is created")
                SetUserValues(userEmailID: userEmailID, password: password,user: (user?.user.uid)!)
                
            } else{
                print("Error in creating new user \(String(describing: error?.localizedDescription))");
                
            }
            
        }
        
    }
    
    //Login function
    
    class func Login(userEmailID:String,password:String)
    {
        Auth.auth().signIn(withEmail: userEmailID, password: password) { (user, error) in
            
            if error == nil
            {
                print("You have successfully logged in")
                
            }else
            {
                print("Error in login ",error?.localizedDescription)
                
            }
        }
        
    }
    
    //set values of new user
    
    class func SetUserValues(userEmailID:String,password:String,user:String)
    {
        let ref = FirebaseUtility.sharedInstance?.getDatabaseInstance();
        ref?.child("users").child(user).setValue(["username":userEmailID,"password":password], withCompletionBlock: { (error, ref) in
            print(error?.localizedDescription)
            print(ref.ref)
        })

    }

    class func UpdateUserValues(userEmailID:String,password:String,user:String)
    {
        let ref = FirebaseUtility.sharedInstance?.getDatabaseInstance();
        ref?.child("users").child(user).update(["username":userEmailID,"password":password], withCompletionBlock: { (error, ref) in
            print(error?.localizedDescription)
            print(ref.ref)
        })
        
    }
    
    

}
    
    //update values of existing user
    //delete existing user
    //log out user
    




