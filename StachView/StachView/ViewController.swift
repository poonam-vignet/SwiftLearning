//
//  ViewController.swift
//  StachView
//
//  Created by Poonam Bhadikar on 24/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var noOfChanceDone:Int? = 1;
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var winner = 0

    @IBOutlet var buttonsOutlets: [UIButton]!

    enum Result:String
    {
        case CrossWon
        case OWon
        case Withdraw
        
    }
    var alreadySelectedPlaces = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
//        if(!alreadySelectedPlaces.contains(sender.tag))
//        {
           // alreadySelectedPlaces.append(sender.tag)
            if gameState[sender.tag] == 0 && winner == 0
            {
                var myImage:UIImage
                if((noOfChanceDone!%2) == 0) {
                    myImage = UIImage(named: "O")!
                    
                    gameState[sender.tag] = 2

                }
                else {
                    myImage = UIImage(named: "cross")!
                    gameState[sender.tag] = 2

                    
                }

                sender.setBackgroundImage(myImage, for: .normal)
                FindWinner()

                
            }
            
            
           
            
        //}

        
       // alreadySelectedPlaces.append(sender.tag)
        
        //print("Button tapped \(sender.tag)")
    }
    
    
    
      func FindWinner()
      {
        for combination in winningCombinations
        {
            if gameState[combination[0]] == gameState[combination[1]] &&
                gameState[combination[0]] == gameState[combination[2]] &&
                gameState[combination[0]] != 0
            {
                winner = gameState[combination[0]]
            }
        }
        
        if winner != 0
        {
        
            if winner == 1
            {
                print("1 is winner")
            }
            else
            {
                print("2 is winner")

            }
            
            
        }
        
        noOfChanceDone = noOfChanceDone! + 1
        if noOfChanceDone == 10 && winner == 0
        {
            
        }
    }

      }

    
    
    
//    func FindWinner() ->(Result)
//    {
//        if(alreadySelectedPlacesForCross.contains(0))
//        {
//            if(alreadySelectedPlacesForCross.contains(1) && alreadySelectedPlacesForCross.contains(2)){
//
//                var alert = UIAlertController(title: "Cross is winner", message: "",preferredStyle: .alert)
//
//                var alertAction = UIAlertAction(title: "OK", style: .default)
//                {
//                    [unowned self] action in
//                    for  button in self.buttonsOutlets
//                    {
//                        button.setBackgroundImage(nil, for:.normal)
//                    }
//                    self.alreadySelectedPlaces = []
//                    self.alreadySelectedPlacesForCross = []
//                    self.alreadySelectedPlacesForO = []
//
//                }
//
//                alert.addAction(alertAction)
//                present(alert, animated: true, completion: nil)
//
//                return Result.CrossWon
//
//
//            }
//            else if(alreadySelectedPlacesForCross.contains(4) && alreadySelectedPlacesForCross.contains(8))
//            {
//                var alert = UIAlertController(title: "Cross is winner", message: "",preferredStyle: .alert)
//
//                var alertAction = UIAlertAction(title: "OK", style: .default)
//                {
//                    [unowned self] action in
//                    for  button in self.buttonsOutlets
//                    {
//                        button.setBackgroundImage(nil, for:.normal)
//                    }
//                    self.alreadySelectedPlaces = []
//                    self.alreadySelectedPlacesForCross = []
//                    self.alreadySelectedPlacesForO = []
//
//
//
//                }
//
//                alert.addAction(alertAction)
//                present(alert, animated: true, completion: nil)
//
//                return Result.CrossWon
//            }
//            else if(alreadySelectedPlacesForCross.contains(3) && alreadySelectedPlacesForCross.contains(6))
//            {
//
//                var alert = UIAlertController(title: "Cross is winner", message: "",preferredStyle: .alert)
//
//                var alertAction = UIAlertAction(title: "OK", style: .default)
//                {
//                    [unowned self] action in
//                    for  button in self.buttonsOutlets
//                    {
//                        button.setBackgroundImage(nil, for:.normal)
//                    }
//                    self.alreadySelectedPlaces = []
//                    self.alreadySelectedPlacesForCross = []
//                    self.alreadySelectedPlacesForO = []
//
//                }
//
//                alert.addAction(alertAction)
//                present(alert, animated: true, completion: nil)
//
//                return Result.CrossWon
//            }
//
//
//        }
//        if(alreadySelectedPlacesForO.contains(0))
//        {
//            if(alreadySelectedPlacesForO.contains(1) && alreadySelectedPlacesForO.contains(2)){
//                var alert = UIAlertController(title: "O is winner", message: "",preferredStyle: .alert)
//
//                var alertAction = UIAlertAction(title: "OK", style: .default)
//                {
//                    [unowned self] action in
//                    for  button in self.buttonsOutlets
//                    {
//                        button.setBackgroundImage(nil, for:.normal)
//                    }
//
//                    self.alreadySelectedPlaces = []
//                    self.alreadySelectedPlacesForCross = []
//                    self.alreadySelectedPlacesForO = []
//                }
//
//                alert.addAction(alertAction)
//
//                present(alert, animated: true, completion: nil)
//                return Result.OWon
//
//            }
//
//            else if(alreadySelectedPlacesForO.contains(4) && alreadySelectedPlacesForO.contains(8))
//            {
//                var alert = UIAlertController(title: "O is winner", message: "",preferredStyle: .alert)
//
//                var alertAction = UIAlertAction(title: "OK", style: .default)
//                {
//                    [unowned self] action in
//                    for  button in self.buttonsOutlets
//                    {
//                        button.setBackgroundImage(nil, for:.normal)
//                    }
//
//                    self.alreadySelectedPlaces = []
//                    self.alreadySelectedPlacesForCross = []
//                    self.alreadySelectedPlacesForO = []
//                }
//
//                alert.addAction(alertAction)
//
//                present(alert, animated: true, completion: nil)
//                return Result.OWon
//            }
//            else if(alreadySelectedPlacesForO.contains(3) && alreadySelectedPlacesForO.contains(6))
//            {
//
//                var alert = UIAlertController(title: "O is winner", message: "",preferredStyle: .alert)
//
//                var alertAction = UIAlertAction(title: "OK", style: .default)
//                {
//                    [unowned self] action in
//                    for  button in self.buttonsOutlets
//                    {
//                        button.setBackgroundImage(nil, for:.normal)
//                    }
//
//                    self.alreadySelectedPlaces = []
//                    self.alreadySelectedPlacesForCross = []
//                    self.alreadySelectedPlacesForO = []
//                }
//
//                alert.addAction(alertAction)
//
//                present(alert, animated: true, completion: nil)
//                return Result.OWon
//            }
//
//
//
//        }
//        return Result.Withdraw;
//    }
    

    


