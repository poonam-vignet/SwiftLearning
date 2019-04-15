//
//  PlayingCardDeck.swift
//  PlayingCards
//
//  Created by Poonam Bhadikar on 13/04/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import Foundation
struct PlayingCardDeck{
    
    private(set) var cardsToPlay:[PlayingCard] = [PlayingCard]();
    
    init()
    {
        for suit in PlayingCard.Suit.all
        {
            for rank in PlayingCard.Rank.all
            {
                cardsToPlay.append(PlayingCard(suit: suit,rank: rank))
            }
        }
    }
    
    mutating func draw()->PlayingCard?// withdrawing from deck of cards
    {
        if(cardsToPlay.count>0)
        {
            return cardsToPlay.remove(at:cardsToPlay.count.arc4random);
        }
        return nil
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
