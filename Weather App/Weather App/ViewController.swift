//
//  ViewController.swift
//  Weather App
//
//  Created by Poonam Bhadikar on 30/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tempValueLbl: UILabel!
    @IBOutlet weak var humidityValueLbl: UILabel!
    @IBOutlet weak var pressureValueLbl: UILabel!
    @IBOutlet weak var windValueLbl: UILabel!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate;
    
    let apiKey = "eca72797271e7bed37b4d86cf282faf2";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        
    }
    
    
    func getWhetherData(selectedCity :String)
    {
        
        let whetherHelper = WhetherHelper(apikey: self.apiKey)
        
        whetherHelper.getWhetherDetailsForCity(appdelegate:self.appdelegate,city: selectedCity) { (currentWhether) in
            
            DispatchQueue.main.async {
                let temp = String(describing: currentWhether.temperature!)
                let humidity = String(describing: currentWhether.humidity!)
                let pressure = String(describing: currentWhether.pressure!)
                let wind = String(describing:currentWhether.windSpeed!)
                
                self.updateUI(temp: temp, humidity: humidity, pressure: pressure, wind: wind)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.humidityValueLbl.text = ""
        self.tempValueLbl.text = ""
        self.pressureValueLbl.text = ""
        self.windValueLbl.text = ""
        
        
        //if city present in db :take value from db and display on UI
        
        let whetherHelper = WhetherHelper(apikey: self.apiKey)
        
        var alreadyPresentEntry = whetherHelper.verifyAndFetchAlreadySearchedEntry(appdelegate: appdelegate, city: (searchBar.text?.replacingOccurrences(of: " ", with: "%20"))!)
        
        if(alreadyPresentEntry.isEmpty)
        {
            getWhetherData(selectedCity: (searchBar.text?.replacingOccurrences(of: " ", with: "%20"))!)
        }
        else
        {
            updateUI(temp: String(describing: alreadyPresentEntry["temperature"]!), humidity: String(describing: alreadyPresentEntry["humidity"]!), pressure: String(describing: alreadyPresentEntry["pressure"]!), wind: String(describing: alreadyPresentEntry["windspeed"]!))
        }
        
        searchBar.resignFirstResponder()
        
    }
    
    func updateUI(temp:String,humidity:String,pressure:String,wind:String)
    {
        DispatchQueue.main.async {
            self.tempValueLbl.text = temp
            self.humidityValueLbl.text = humidity
            self.pressureValueLbl.text = pressure
            self.windValueLbl.text = wind
            
        }
    }
    
    
}
