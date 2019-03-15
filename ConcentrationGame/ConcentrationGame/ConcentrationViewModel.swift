//
//  ConcentrationViewModel.swift
//  ConcentrationGame
//
//  Created by Poonam Bhadikar on 12/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//


///There are 3 scenarios to handle:
// Case 1: if no card is faceUp and user selects one card we will set indexOfOneAndOnlyFaceUpCard to that cards index
// Case 2:If there are two cards which are face up but are not matching, and now user chooses one card , in this case we need to face down those 2 previously face up cards
// Case 3 :If There there is one faceUp card and user selcts another card , we need to perform matching in this perticular case

import Foundation
class ConcentrationViewModel
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard:Int? // case for matching , we need to have senarioc where only one card is already face up
    
    func ChooseCard(at index:Int)
    {
        //       if cards[index].isFaceUp
        //       {
        //        cards[index].isFaceUp = false
        //       }
        //       else
        //       {
        //        cards[index].isFaceUp = true
        //       }
        
        
        if !cards[index].isMatched
        {        //Case 3:

            if let indexToMatch = indexOfOneAndOnlyFaceUpCard,indexToMatch != index
            {
                if cards[indexToMatch].identifier == cards[index].identifier
                {
                    cards[indexToMatch].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true; //need to flip card a face up
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else // case 1 and 2
            {
                for faceToDown in cards.indices{
                    cards[faceToDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
            
        }
        
        
    }
    init(numberOfPairsOfCards:Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card(identifier: Card.getUniqueIdentifier())
            cards += [card, card]
        }
        
    }
}
