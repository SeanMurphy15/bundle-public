//
//  EndDateCell.swift
//  Bundle
//
//  Created by Sean Murphy on 4/13/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class EndDateCell: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var dateTextField: UITextField!

    func respondWithDatePicker(){

        dateTextField.delegate = self
        dateTextField.becomeFirstResponder()

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        dateTextField.inputView = datePicker
        datePicker.addTarget(self, action: "datePickerChanged:", forControlEvents: .ValueChanged)
    }

    func datePickerChanged(sender: UIDatePicker){

        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .ShortStyle
        dateTextField.text = formatter.stringFromDate(sender.date)
    }
}
