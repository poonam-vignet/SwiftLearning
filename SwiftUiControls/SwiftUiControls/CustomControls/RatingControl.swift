//
//  RatingControl.swift
//  SwiftUiControls
//
//  Created by Poonam Bhadikar on 16/05/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // Mark : Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()

        //fatalError("init(coder:) has not been implemented")
    }
    
    func setUpButtons() -> ()
    {
        //Add button
        let button = UIButton();
        button.backgroundColor = UIColor.blue
        
        // add constraint
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        addArrangedSubview(button)
        
    }
    
}
