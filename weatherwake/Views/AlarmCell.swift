//
//  MyLabelCell.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 04/11/2017.
//  Copyright © 2017 mready. All rights reserved.
//

import UIKit

protocol AlarmCellDelegate {
    func onSwitchChanged(alarm: Alarm?)
}

class AlarmCell: UITableViewCell {
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var daysLabel: UILabel!
    @IBOutlet private weak var activeSwitch: UISwitch!
    
    private var alarm: Alarm?
    var delegate: AlarmCellDelegate?
    
    func load(alarm: Alarm) {
        self.alarm = alarm
        titleLabel.text = alarm.name
    }

    @IBAction private func onSwitchChanged() {
        print("Hello from Table Cell IBAction")
        delegate?.onSwitchChanged(alarm: alarm)
    }
}
