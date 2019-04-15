//
//  PlayingCard.swift
//  PlayingCards
//
//  Created by Poonam Bhadikar on 13/04/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import Foundation

struct PlayingCard:CustomStringConvertible{
    
    var description: String{return "\(suit)\(rank)"} // custom string representation comes with CustomStringConvertible
    
    var suit :Suit
    var rank :Rank
    
    enum Suit:String,CustomStringConvertible{
        
        var description: String{return rawValue}
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all:[Suit]{
            let allSuits:[Suit] = [Suit.spades,.hearts,.clubs,.diamonds]
            return allSuits
        }
    }
    
    enum Rank:CustomStringConvertible{
        var description: String {
            switch self {
            case .ace: return "A"
            case .numeric(let number):return String(number)
            case .face(let kind):return kind
            }
        }
        
        case ace
        case face(String) // string which is either , j , q or K
        case numeric(Int)
        
        var order :Int{
            switch self {
            case .ace: return 1
            case .numeric(let numberOncard): return numberOncard;
            case .face(let kind) where kind == "J":return 11
            case .face(let kind) where kind == "Q":return 12
            case .face(let kind) where kind == "K":return 1
            default: return 0;
            }
        }
        static var all :[Rank]
        {
            var allRank :[Rank] = [Rank.ace]
            for eachNoOnCard in 2...10
            {
                allRank.append(.numeric(eachNoOnCard))
            }
            allRank += [.face("J"),.face("Q"),.face("K")]
            return allRank
        }
    }
    
}

