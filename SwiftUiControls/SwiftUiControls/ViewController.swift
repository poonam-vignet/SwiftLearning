//
//  ViewController.swift
//  SwiftUiControls
//
//  Created by Poonam Bhadikar on 15/05/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,
UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputTextField.delegate = self;
        ImageView.isUserInteractionEnabled = true; //Imp
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBOutlet weak var InputTextField: UITextField!
    
    @IBOutlet weak var ImageView: UIImageView!
   
    @IBAction func PhotoSelection(_ sender: UITapGestureRecognizer)
    {
        //Hide keyboard
        InputTextField.resignFirstResponder();
        
        //Create and present UIImageController
        let uiImagePickerController = UIImagePickerController();
        
        //Set source type of imagePickerController
        
        uiImagePickerController.sourceType = .photoLibrary;
        
        //Assign delegate
        uiImagePickerController.delegate = self;
        
        //Present controller
        
        present(uiImagePickerController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        InputTextField.resignFirstResponder();
        return true;
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        ImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
}

