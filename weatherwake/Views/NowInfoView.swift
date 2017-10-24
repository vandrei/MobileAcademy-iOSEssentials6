//
//  NowInfoView.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 01/04/16.
//  Copyright © 2016 mready. All rights reserved.
//

import UIKit

class NowInfoView: UIView {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initDateTimer()
        loadDateAndTime()
    }
    
    func initDateTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loadDateAndTime), userInfo: nil, repeats: true)
    }
    
    func loadWeatherCondition(_ condition: WeatherCondition) {
        // TODO: Extract city name and temperature from condition model
        
        // TODO: Get the necessary image for the current weather condition
        // TODO: Set the image
    }
    
    func loadDateAndTime() {
        // TODO: Get the current time/date
        let currentDate = Date()
        
        // TODO: extract current time from the date using DateConverter
        // TODO: extract current day from the date using DateConverter
        let currentTime = DateConverter.getTime(currentDate)
        let currentDay = DateConverter.getDay(currentDate)
        
        // TODO: Set time and day on designated labels
        timeLabel.text = currentTime
        dateLabel.text = currentDay
    }
}
