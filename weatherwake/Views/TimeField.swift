//
//  TimeField.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 31/03/16.
//  Copyright © 2016 mready. All rights reserved.
//

import UIKit

class TimeInputField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()

        configureInputView()
    }
    
    func dismissInputView() {
        self.resignFirstResponder()
    }
    
    // Preloads a given date
    func loadDate(_ date:Date) {
        setTimeText(date)
        setPickerDate(date)
    }
    
    func getSelectedDate() -> Date {
        let datePicker = self.inputView as! UIDatePicker
        return datePicker.date
    }
    
    // Method triggerd when a time is selected in the picker input
    func didSelectDate(_ datePicker:UIDatePicker) {
        setTimeText(datePicker.date)
    }
    
    fileprivate func setTimeText(_ date:Date) {
        let timeString = DateConverter.getTime(date)
        self.text = timeString
    }
    
    fileprivate func setPickerDate(_ date:Date) {
        let datePicker = self.inputView as! UIDatePicker
        datePicker.date = date
    }
    
    // Configures the input as a PickerView
    fileprivate func configureInputView() {
        setPickerInputView()
        setAccessoryInputView()
    }
    
    // Sets a spinning picker as input source for the text field
    fileprivate func setPickerInputView() {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.locale = Locale(identifier: "RO")
        picker.addTarget(self, action: #selector(didSelectDate(_:)), for: UIControlEvents.valueChanged)
        
        inputView = picker
    }
    
    // Sets a Toolbar with a "Done" button on the input view
    fileprivate func setAccessoryInputView() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
        
        toolbar.barStyle = .default
        toolbar.items = [UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissInputView))]
        
        self.inputAccessoryView = toolbar
    }
}
