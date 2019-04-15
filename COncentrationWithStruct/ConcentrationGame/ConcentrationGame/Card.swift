//
//  Card.swift
//  ConcentrationGame
//
//  Created by Poonam Bhadikar on 12/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import Foundation
struct Card: Hashable
{
    var hashValue: Int {return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp:Bool = false
    var isMatched:Bool = false
    private var identifier: Int // made private after making card as hashable
    
    private static var identifierGenerator = 0
    
    static func getUniqueIdentifier()->Int
    {
        identifierGenerator = identifierGenerator + 1;
        return identifierGenerator
    }
    
    // identifier here is an external name(used during calling) and i is internal name
    init(identifier:Int)
    {
        self.identifier = identifier
        
    }
}
