//
//  CustomCell.swift
//  Navigation
//
//  Created by Poonam Bhadikar on 27/05/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var carNameValueLabel: UILabel!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carimage: UIImageView!
}
