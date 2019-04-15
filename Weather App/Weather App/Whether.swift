//
//  Whether.swift
//  Weather App
//
//  Created by Poonam Bhadikar on 30/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//


//This class is responsible for taking json dictionary and decoding it and storing it to whether class object
import Foundation
class Whether{
    
    var humidity:Int? = 0
    var temperature:Double? = 0
    var pressure:Int? = 0
    var windSpeed:Double? = 0
    
    struct WhetherKeys {
        static let humidity = "humidity"
        static let temperature = "temp"
        static let pressure = "pressure"
        static let windSpeed = "speed"
        
    }
    
    init(whetherDictionary:[String:Any])
    {
        if let weathermain = whetherDictionary["main"] as? [String:Any]
        {
            if let humidity = weathermain[WhetherKeys.humidity] as? Int
            {
                self.humidity = humidity
            }
            if let temp = weathermain[WhetherKeys.temperature] as? Double
            {
                self.temperature = temp
            }
            if let pressure = weathermain[WhetherKeys.pressure] as? Int
            {
                self.pressure = pressure
            }
        }
        if let wind = whetherDictionary["wind"] as? [String:Any]
        {
            if let windSpeed = wind[WhetherKeys.windSpeed] as? Double
            {
                self.windSpeed =  windSpeed
            }
        }
        
    }
    
}

