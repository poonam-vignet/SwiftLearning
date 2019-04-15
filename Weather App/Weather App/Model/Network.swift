//
//  Network.swift
//  Weather App
//
//  Created by Poonam Bhadikar on 30/03/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

//This Class will handle network API calls

import Foundation

class Network{
    
    lazy var sessionConfiguaration:URLSessionConfiguration =  URLSessionConfiguration.default;
    lazy var session : URLSession = URLSession(configuration: sessionConfiguaration)
    
    let url :URL
    init(url:URL) {
        self.url = url
    }
    
    typealias jsonDictionaryHandler = (([ String : Any]?)->Void)
    
    
    func  downloadDataFromURL(_ completion : @escaping jsonDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                if let httpResponse = response as? HTTPURLResponse{
                    switch httpResponse.statusCode{
                    case 200:
                        if let data = data{
                            do{
                                
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data,options: .mutableContainers)
                                print(data)
                                completion(jsonDictionary as? [String:Any])
                                
                            }
                            catch let someError as NSError{
                                print("Error in parsing received error \(someError)")
                                completion(nil)
                            }
                            
                        }
                    default:
                        print("invalid response")
                    }
                    
                }
            }
            else{
                print("Error \(error)")
            }
        }
        dataTask.resume();
        
    }
}
