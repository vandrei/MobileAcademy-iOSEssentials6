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
    @IBOutlet private weak var alarmTableView: UITableView!
    var databaseAlarms: [Alarm] = []
    
    func onSwitchChanged(alarm: Alarm?) {
        print("Hello from Controller IMplemented Delegate")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseAlarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell") as! AlarmCell
        cell.load(alarm: databaseAlarms[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestWeatherCondition()
        databaseAlarms = AlarmDA().getAllAlarms()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        databaseAlarms = AlarmDA().getAllAlarms()
        alarmTableView.reloadData()
        
    }
    
    func requestWeatherCondition() {
        let url = "http://api.openweathermap.org/data/2.5/weather"
        let params = ["lat": 44.454026,
                      "lon": 26.099628,
                      "units": "metric",
                      "appid": "8c81c350710733b1e90609c3a17e3175"] as [String: Any]

        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { (dataResponse) in
                let jsonResponse = dataResponse.result.value as! [String: Any]
                let weatherCondition = WeatherCondition(json: jsonResponse)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAlarmSegue" {
            (segue.destination as! AlarmDetailsController).alarm = AlarmDA().createAlarm()
        }
        
        if (segue.identifier == "cellAutoSegue") {
            let cell = sender as! AlarmCell
            let indexPath = alarmTableView.indexPath(for: cell)!
            (segue.destination as! AlarmDetailsController).alarm = databaseAlarms[indexPath.row]
        }
    }
    
    @IBAction func onButtonDragOutside(_ sender: Any) {
    }
    
    @IBAction func onAddButtonTapped() {
        print("Salut!")
    }
}
