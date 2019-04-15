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
    
   private(set) var flipCount = 0
    {
        didSet{
            flipCountLabel.text = "Flip Count : \(flipCount)"
        }
    }
    
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
   private lazy var game:ConcentrationViewModel = ConcentrationViewModel(numberOfPairsOfCards:numberOfPairsOfCards)
    
    
    var numberOfPairsOfCards :Int{
       // get{(// if you have only Get(readonly properties) you can ignore get)
            return (buttonCollection.count+1)/2
       // }
    }
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
    private func updateViewFromModel(){
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
    
    private var emojiChoices = "👻👹👿😎👹🐶🐥🐹😇😱" // make ot as string of chars
    //["👻","👹","👿","😎","👹","🐶","🐥","🐹","😇","😱"]

    
    // instead of identifier we can actually comapre cards by making card as hasable which is equitable by default
    private var emojis = [Card:String]() // Identifier and Emoji
    private func getEmoji(for card :Card) -> String {
        if emojis[card] == nil,emojiChoices.count>0
        {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
        emojis[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
     return emojis[card] ?? "?"
    }
    
}
extension Int
{
    var arc4random:Int
    {
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0
        {
        return Int(arc4random_uniform(UInt32(abs(self))))
        }else
        {
        return 0
        }
    }
}

