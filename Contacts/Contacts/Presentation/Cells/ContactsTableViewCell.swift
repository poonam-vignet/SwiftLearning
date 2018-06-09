//
//  ContactsTableViewCell.swift
//  Contacts
//
//  Created by Poonam Bhadikar on 06/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var ContactName: UILabel!
    @IBOutlet weak var workingPlace: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
}
