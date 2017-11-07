//
//  AlarmListController.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 21/10/2017.
//  Copyright © 2017 mready. All rights reserved.
//

import UIKit
import Alamofire

class AlarmListController: BaseController, UITableViewDataSource, UITableViewDelegate, AlarmCellDelegate {
    func onSwitchChanged(alarm: Alarm?) {
        print("Hello from Controller IMplemented Delegate")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell") as! AlarmCell
        
        cell.delegate = self
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestWeatherCondition()
    }
    
    func requestWeatherCondition() {
        let url = "http://api.openweathermap.org/data/2.5/weather"
        let params = ["lat": 44.454026,
                      "lon": 26.099628,
                      "units": "metric",
                      "appid": "8c81c350710733b1e90609c3a17e3175"] as [String: Any]

        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (dataResponse) in
                dataResponse.
                let jsonResponse = dataResponse.result.value as! [String: Any]
                let weatherCondition = WeatherCondition(json: jsonResponse)
        }
    }
    
    
    @IBAction func onButtonDragOutside(_ sender: Any) {
    }
    
    @IBAction func onAddButtonTapped() {
        print("Salut!")
    }
}
