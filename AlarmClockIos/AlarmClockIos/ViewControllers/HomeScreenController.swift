//
//  HomeScreenController.swift
//  AlarmClockIos
//
//  Created by Poonam Bhadikar on 04/08/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class HomeScreenController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
         var worldClockViewController = WorldClockViewController();
        var controllers = [worldClockViewController]
        self.viewControllers = viewControllers;
        
        
//        var controllers = viewControllers;
//        var worldController = controllers![0]
//        worldController.navigationController?.navigationBar.barTintColor = UIColor.black;
        
        if let items = self.tabBar.items
        {
            for item in items
            {
                print("Item tag",item.tag)
                switch(item.tag)
                {
                case 0:
                    item.image = UIImage(named:"Alarm")?.withRenderingMode(.alwaysOriginal)
                case 1:
                    item.image = UIImage(named:"WorldClockNormal")?.withRenderingMode(.alwaysOriginal)
                case 2:
                    item.image = UIImage(named:"BedTime")?.withRenderingMode(.alwaysOriginal)
                case 3:
                    item.image = UIImage(named:"StopWatch")?.withRenderingMode(.alwaysOriginal)
                default:
                    item.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
              
                }
            }
        }
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pushToNextVC() {
        let newVC = UIViewController()
        newVC.view.backgroundColor = UIColor.red
        self.navigationController?.pushViewController(newVC, animated:
            true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
