//
//  WhetherHelper.swift
//  Weather App
//
//  Created by Poonam Bhadikar on 30/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import Foundation
class WhetherHelper
{
    var baseURL : URL?
    let APIKey: String
    
    // https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=eca72797271e7bed37b4d86cf282faf2"
    
    init(apikey:String){
        APIKey = apikey
    }
    
    func getWhetherDetailsForCity(appdelegate:AppDelegate,city:String,completion :@escaping (Whether) -> Void)
    {
        if let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(APIKey)")
        {
            let network = Network(url: baseURL)
            network.downloadDataFromURL{(jsonDictionary) in
                // print(jsonDictionary!)
                
                if(jsonDictionary != nil)
                {
                    let whether = Whether(whetherDictionary: jsonDictionary!)
                    completion(whether)
                    let databaseManager = DataBaseManager()
                    databaseManager.insertToTable(appdelegate:appdelegate,city:city, temp: whether.temperature!, humidity: whether.humidity!, pressure: whether.pressure!, windSpeed: whether.windSpeed!)
                }
                
            }
        }
        
    }
    
    func verifyAndFetchAlreadySearchedEntry(appdelegate:AppDelegate, city:String)->([String:Any])
    {
        let databaseManager = DataBaseManager();
        let dataFetched = databaseManager.fetchData(appdelegate: appdelegate, cityToBeChecked: city)
        return dataFetched
    }
    
    
}
