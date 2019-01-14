//
//  AlarmTableViewCell.swift
//  AlarmClockIos
//
//  Created by Poonam Bhadikar on 11/08/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
     @IBOutlet var ClockTime: UILabel!
    
    @IBOutlet var ClockShortTime: UILabel!
    @IBOutlet var ZoneNAme: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
