//
//  CustomPlaceholderTextField.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 31/03/16.
//  Copyright © 2016 mready. All rights reserved.
//

import UIKit

// TODO: Use this class for the "Name" TextField on the Alarm Details Screen

@IBDesignable
class ColoredPlaceholderTextField: UITextField {
    @IBInspectable var placeholderColor: UIColor = UIColor.black {
        didSet {
            setPlaceholdeColor()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setPlaceholdeColor()
    }
    
    func setPlaceholdeColor() {
        if (self.placeholder == nil) {
            return
        }
        
        let attributes = [NSForegroundColorAttributeName: placeholderColor]
        let attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributes)
        self.attributedPlaceholder = attributedPlaceholder
    }
}
