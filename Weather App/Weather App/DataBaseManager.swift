//
//  DataBaseManager.swift
//  Weather App
//
//  Created by Poonam Bhadikar on 30/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import Foundation
import  CoreData
import  UIKit
class DataBaseManager{
    
    
    func insertToTable(appdelegate:AppDelegate,city:String,temp:Double,humidity:Int,pressure:Int,windSpeed:Double)
    {
        
        let context = appdelegate.persistentContainer.viewContext;
        
        if let entity = NSEntityDescription.entity(forEntityName: "WhetherTable", in: context)
        {
            let newCityEntry = NSManagedObject(entity: entity, insertInto: context)
            newCityEntry.setValue(city, forKey:"city")
            newCityEntry.setValue(temp, forKey:"temperature")
            newCityEntry.setValue(humidity, forKey: "humidity")
            newCityEntry.setValue(pressure, forKey: "pressure")
            newCityEntry.setValue(windSpeed, forKey: "windspeed")
            
            do {
                try context.save()
                print("Data inserted Successfully")
                
            } catch {
                print("Failed saving")
            }
        }
        
    }
    
    func fetchData(appdelegate:AppDelegate,cityToBeChecked:String) -> ([String:Any]) {
        var dictionary : [String:Any] = [:];
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WhetherTable")
        
        request.returnsObjectsAsFaults = false
        do {
            
            let context = appdelegate.persistentContainer.viewContext;
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                if(((data.value(forKey: "city") as! String).caseInsensitiveCompare(cityToBeChecked)) == .orderedSame)
                {
                    let temp = data.value(forKey: "temperature");
                    let humidity = data.value(forKey: "humidity");
                    let pressure = data.value(forKey: "pressure");
                    let windSpeed = data.value(forKey: "windspeed");
                    
                    dictionary["temperature"] = temp
                    dictionary["humidity"] = humidity
                    dictionary["pressure"] = pressure
                    dictionary["windspeed"] = windSpeed
                    
                    
                }
            }
            
        } catch {
            print("Error while fetching data")
        }
        return dictionary;
    }
    
}
