//
//  WeekdaysSelectorView.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 31/03/16.
//  Copyright © 2016 mready. All rights reserved.
//

import UIKit

class WeekdaysSelectorView: UIView {
    @IBOutlet private var buttons: [UIButton]!
    
    func getSelectedDays() -> [NSNumber] {
        var tagsArray = [NSNumber]()
        
        for button in buttons {
            if (button.isSelected) {
                tagsArray.append(NSNumber(integerLiteral: button.tag))
            }
        }
        
        return tagsArray
    }
    
    func selectDays(_ days:[NSNumber]) {
        for button in buttons {
            let tagNumber = NSNumber(integerLiteral: button.tag)
            if (days.contains(tagNumber)) {
                button.isSelected = true
            }
        }
    }
    
    fileprivate func configureButtonFont(_ button:UIButton) {
        let fontSize = button.titleLabel?.font.pointSize
        
        if (button.isSelected) {
            button.titleLabel?.font = Fonts.regularFont(fontSize!)
        } else {
            button.titleLabel?.font = Fonts.lightFont(fontSize!)
        }
    }
    
    @IBAction func onDayButtonTapped(button: UIButton) {
        button.isSelected = !button.isSelected
        configureButtonFont(button)
    }
}
