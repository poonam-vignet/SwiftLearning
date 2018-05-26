//
//  ViewController.swift
//  StackViewTrial1
//
//  Created by Poonam Bhadikar on 24/05/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var mealNameLabel: UILabel!
  
    @IBOutlet weak var mealNameTextField: UITextField!
    
    @IBAction func setLabelButton(_ sender: UIButton) {
    }
    @IBOutlet weak var photoImageView: UIImageView!

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handles textfield input through delegates call back
        mealNameTextField.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealNameTextField.resignFirstResponder();
        return true;
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
    
        mealNameTextField.resignFirstResponder();
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = mealNameTextField.text;
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            else{
                return;
        }
        
        photoImageView.image = selectedImage
        
        //Dismiss picker
        dismiss(animated: true, completion: nil)
    }
}

