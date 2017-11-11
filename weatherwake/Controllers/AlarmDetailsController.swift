//
//  AlarmDetailsController.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 21/10/2017.
//  Copyright © 2017 mready. All rights reserved.
//

import UIKit

class AlarmDetailsController: BaseController {
    var alarm: Alarm!
    @IBOutlet private weak var titleField: UITextField!
    
    @IBAction func onSaveTapped() {
        alarm.name = titleField.text
        AlarmDA().save()
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (alarm != nil){
             titleField.text = alarm.name
        }
    }
        
    
}
