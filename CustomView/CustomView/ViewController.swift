//
//  ViewController.swift
//  CustomView
//
//  Created by Poonam Bhadikar on 28/07/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let customLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height:50))
        
        customLabel.numberOfLines = 0;
        customLabel.lineBreakMode = .byWordWrapping;
        customLabel.textColor =  UIColor.blue;
        customLabel.font = UIFont.boldSystemFont(ofSize: 20)
        customLabel.textAlignment = .center
        customLabel.backgroundColor = UIColor.cyan
        customLabel.text = "This is a programatically created label"
        
        customLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true;
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customLabel);
        
        
        let customButton = UIButton(frame: CGRect(x: 20, y: 100, width: view.frame.width-40, height:50))
//        customButton.center.x = self.view.center.x
//        customButton.center.y = self.view.center.y

        
        customButton.setTitle("OK", for: .normal)
        customButton.tintColor = UIColor.blue
        customButton.backgroundColor = UIColor.cyan
        customButton.addTarget(self,action: #selector(self.buttonTapped), for: .touchUpInside)
        
        
//        let margins = view.layoutMarginsGuide;
//
//        customButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 20).isActive = true
        
        
        self.view.addSubview(customButton);
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func buttonTapped()
    {
        print("Button is tapped")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

