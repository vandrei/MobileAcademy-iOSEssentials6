//
//  AlarmListController.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 21/10/2017.
//  Copyright © 2017 mready. All rights reserved.
//

import UIKit

class AlarmListController: BaseController {
    var myVar: String?
    
    func abc() {

        guard let nonNullable = myVar else { return }
        
        if let def = myVar {
            
        }
        
    }
    
    
    @IBAction func onButtonDragOutside(_ sender: Any) {
    }
    
    @IBAction func onAddButtonTapped() {
        print("Salut!")
    }
}
