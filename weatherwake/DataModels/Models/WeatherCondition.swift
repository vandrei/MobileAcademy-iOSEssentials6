//
//  WeatherCondition.swift
//  weatherwake
//
//  Created by Bogdan Dumitrescu on 4/1/16.
//  Copyright © 2016 mready. All rights reserved.
//

import Foundation

class WeatherCondition : NSObject {
    
    var temperature: Double!
    var minTemperature: Double!
    var maxTemperature: Double!
    
    // TODO: Add weather condition member
    
    var city: String!
    var date: Date!
    
    static func deserializeArray(_ json:[String: AnyObject]) -> [WeatherCondition]{
        // TODO: Deserialize json array received as parameter
        // TODO: Extract city information and the forecast array
        // TODO: Iterate throught forecasts and create a new WeatherCondition
        // TODO: Return an array of the create WeatherConditions
        
        return [WeatherCondition]()
    }
    
    init(json: [String : Any]) {
        city = json["name"] as! String
        
        let mainDict = json["main"] as! [String: Any]
        temperature = mainDict["temp"] as! Double
        minTemperature = mainDict["temp_min"] as! Double
        maxTemperature = mainDict["temp_max"] as! Double
        
        let timestamp = json["dt"] as! Int
        date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
    
    func getTemperature() -> String {
        // TODO: Create a string with the temperature and return it
        return ""
    }
}
