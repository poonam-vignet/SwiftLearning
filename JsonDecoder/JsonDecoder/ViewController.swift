//
//  ViewController.swift
//  JsonDecoder
//
//  Created by Poonam Bhadikar on 09/09/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let file = Bundle.main.url(forResource: "Example", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file);
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(JsonResult.self, from: data)
                print(gitData.name)
                
            } catch let err {
                print("Err", err)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        
        // Dispose of any resources that can be recreated.
    }

func readJson()
{
    
    
}
    
}

