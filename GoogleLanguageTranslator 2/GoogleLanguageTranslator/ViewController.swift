//
//  ViewController.swift
//  GoogleLanguageTranslator
//
//  Created by Poonam Bhadikar on 18/11/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit
import ROGoogleTranslate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        //var APIKey = "AIzaSyB1IiDq_N6_37FYX4t2NefIAUOoI2Nx6hk";
//        SwiftGoogleTranslate.shared.start(with: "AIzaSyBZuPFBgp-nORyPSS826cwfJPV6nCbuza4")
//        SwiftGoogleTranslate.shared.translate("Hello!", "es", "en") { (text, error) in
//            if let t = text {
//                print(t)
//            }
//            else{
//                print(error ?? <#default value#>)
//            }
//        }
        
        
        
        var params = ROGoogleTranslateParams(source: "en",
                                             target: "de",
                                             text:   "Here you can add your sentence you want to be translated")
        
        let translator = ROGoogleTranslate()
        translator.apiKey = "AIzaSyB1IiDq_N6_37FYX4t2NefIAUOoI2Nx6hk";
        translator.translate(params: params) { (result) in
            print("Translation: \(result)")
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

