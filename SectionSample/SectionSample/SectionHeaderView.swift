//
//  SectionHeaderView.swift
//  SectionSample
//
//  Created by Poonam Bhadikar on 12/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class SectionHeaderView: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var disclosure: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}
