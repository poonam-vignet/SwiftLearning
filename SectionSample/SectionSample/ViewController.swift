//
//  ViewController.swift
//  SectionSample
//
//  Created by Poonam Bhadikar on 12/06/18.
//  Copyright © 2018 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let cell = uitableView.dequeueReusableCell(withIdentifier: "SectionHeaderViewCell") as! SectionHeaderView;
        cell.titleLabel.text = "sdd"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//
//        let cell = uitableView.dequeueReusableCell(withIdentifier: "SectionHeaderViewCell") as! SectionHeaderView;
//        cell.titleLabel.text = "B"
//
//        return cell.contentView;
//
//        }
    override func viewDidLoad() {
        super.viewDidLoad()
        uitableView.register(UINib(nibName: "SectionHeaderView", bundle: nil),forCellReuseIdentifier: "SectionHeaderViewCell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var uitableView: UITableView!
    

}

