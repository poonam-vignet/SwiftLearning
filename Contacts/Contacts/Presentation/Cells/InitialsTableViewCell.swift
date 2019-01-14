//
//  InitialsTableViewCell.swift
//  Contacts
//
//  Created by Poonam Bhadikar on 13/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class InitialsTableViewCell: UITableViewCell {

    var collapsed : Bool?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var initialsLabel: UILabel!
    
}
