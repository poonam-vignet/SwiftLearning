//
//  ViewController.swift
//  PrimeNumber
//
//  Created by Poonam Bhadikar on 22/04/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInputText: UITextField!
    
    @IBOutlet weak var primeCheckButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primeCheckButton.layer.cornerRadius = 5.0
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkPrimeButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Check prime number", message:"", preferredStyle: UIAlertControllerStyle.alert) // .actionSheet : popup comes from down
        alert.addAction(UIAlertAction(title :"OK",style: UIAlertActionStyle.cancel,handler:nil))
        
        
        var result = false;
        
        if(userInputText.text?.isEmpty)!
        {
            alert.message = "Please enter number"
        }
        else
        {
            alert.message = "Invalid user inputs"
            
            if  let numberToCheck = (Int)(userInputText.text!)
            {
                //            if(nil != numberToCheck)
                //            {
                result = CheckPrimeNumber(number: numberToCheck)
                
                alert.message = "Number is not prime"
                
                if result
                {
                    alert.message = "Number is prime"
                    
                }
                
                //}
                
            }
            
        }
        self.present(alert, animated: true, completion: nil)
        // Completion things to do when alert is presented and handler is action performed on click of OK / button
        
    }
    
    func CheckPrimeNumber(number:Int)->Bool
    {
        if(number == 1)
        {
            return true;
        }
        if(number == 2)
        {
            return false;
        }
        
        for index in 3..<number
        {
            if((number%index)==0)
            {
                return false;
            }
        }
        return true;
    }
    
}

