//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Poonam Bhadikar on 12/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    override func viewDidLoad() {
        updateViewFromModel()
    }
    var flipCount = 0
    {
        didSet{
            flipCountLabel.text = "Flip Count : \(flipCount)"
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
   lazy var game:ConcentrationViewModel = ConcentrationViewModel(numberOfPairsOfCards: (buttonCollection.count+1)/2)
    
    
    @IBAction func CardTouched(_ sender: UIButton) {
        print("Ghost button pressed")
        flipCount += 1
        
        if let cardIndex = buttonCollection.index(of: sender){
        print("index of button clicked is \(cardIndex)")
       // FlipCard(emoji:emojiChoices[cardIndex], on: sender)
            
            
            //After MVC
            game.ChooseCard(at: cardIndex)
            updateViewFromModel()
            
            
        }
        else{
               print("Button is not in button collection")

        }
        
       
        
      //  flipCountLabel.text = "Flips : \(flipCount)"// instead use property observer
    }
    
//    @IBAction func pumpkinTouched(_ sender: UIButton) {
//        print("pumpkin button pressed")
//        flipCount += 1
//       // flipCountLabel.text = "Flips : \(flipCount)"
//        FlipCard(emoji:"🎃", on: sender)
//    }
    
//    func FlipCard(emoji:String,on button:UIButton){
//        if button.currentTitle == emoji
//        {
//            button.setTitle("", for: .normal)
//            button.backgroundColor = UIColor.orange
//        }
//        else{
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = UIColor.white
//        }
//
//    }
    
    //MVC
    func updateViewFromModel(){
        for index in buttonCollection.indices{
            var button = buttonCollection[index]
            let card = game.cards[index]
            if(card.isFaceUp)
            {
                button.backgroundColor = UIColor.white
                button.setTitle(getEmoji(for: card), for: .normal)

            }
            else
            {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
            
        }
    }
    
    var emojiChoices = ["👻","👹","👿","😎","👹","🐶","🐥","🐹","😇","😱"]

    var emojis = [Int:String]() // Identifier and Emoji
    func getEmoji(for card :Card) -> String {
        if emojis[card.identifier] == nil,emojiChoices.count>0
        {
        let randomNumber = Int(arc4random_uniform(UInt32(emojiChoices.count)))
        emojis[card.identifier] = emojiChoices.remove(at: randomNumber)
        
        }
     return emojis[card.identifier] ?? "?"
    }
    
}

