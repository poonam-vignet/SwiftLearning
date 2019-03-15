//
//  Card.swift
//  ConcentrationGame
//
//  Created by Poonam Bhadikar on 12/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import Foundation
struct Card
{
    var isFaceUp:Bool = false
    var isMatched:Bool = false
    var identifier: Int
    
     static var identifierGenerator = 0
    
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
