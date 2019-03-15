//
//  ViewController.swift
//  TimeSheetManager
//
//  Created by Poonam Bhadikar on 07/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailIDTextField: UITextField!{
        didSet{
            emailIDTextField.tintColor = UIColor.gray
            emailIDTextField.setIcon(leftImage:#imageLiteral(resourceName: "emailIcon3"))
        }
    }
    
    @IBOutlet var passwordTextField: UITextField!{
        didSet{
            passwordTextField.tintColor = UIColor.gray
            passwordTextField.setIcon(leftImage: #imageLiteral(resourceName: "Password6"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpUI()
    {
//        var emailImage = UIImage(named: "LoginLogo.png")
//
//        emailIDTextField.setIcon(leftImage: #imageLiteral(resourceName: "download (4)"))
        
//        emailIDTextField.leftViewMode = .always
//        var emailImageView = UIImageView()
//        var emailImage = UIImage(named: "LoginLogo.png")
//        emailImageView.image = emailImage
//        emailIDTextField.leftView = emailImageView
    }


}
extension UITextField
{
    func setIcon(leftImage:UIImage)
{
    let iconContainerView = UIView(frame: CGRect(x:30,y:0,width:20,height : 20))
    let iconImageView = UIImageView(frame: CGRect(x:10, y: 5, width: 10, height: 10))
    iconImageView.image = leftImage
    iconImageView.contentMode = .scaleToFill
    iconContainerView.addSubview(iconImageView)
    leftView = iconContainerView
    leftViewMode = .always
}
}

