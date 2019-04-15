//
//  ViewController.swift
//  PlayingCards
//
//  Created by Poonam Bhadikar on 13/04/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var carddeck:PlayingCardDeck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for _ in 1...10
        {
            let card = carddeck.draw();
            print("\(card!)")
        }
    }
    
}

