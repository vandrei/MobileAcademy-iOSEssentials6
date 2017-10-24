//
//  AlarmDetailsController.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 21/10/2017.
//  Copyright © 2017 mready. All rights reserved.
//

import UIKit

class AlarmDetailsController: BaseController {
    @IBAction func onTrashTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
