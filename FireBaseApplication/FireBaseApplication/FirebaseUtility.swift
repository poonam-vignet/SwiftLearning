//
//  FirebaseUtility.swift
//  FireBaseApplication
//
//  Created by Poonam Bhadikar on 29/07/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import Foundation
import Firebase
class FirebaseUtility
{
    var databaseInstance:DatabaseReference = Database.database().reference();
    static var sharedInstance:FirebaseUtility? = FirebaseUtility();

    
     public func getDatabaseInstance() ->  DatabaseReference{
        return databaseInstance;
    }
    
}

