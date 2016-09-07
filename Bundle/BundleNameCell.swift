//
//  BundleNameCell.swift
//  Bundle
//
//  Created by Sean Murphy on 4/13/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import Foundation

class BundleNameCell: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var bundleNameTextField: UITextField!

    

    func textFieldShouldReturn(textField: UITextField) -> Bool {

        if textField != "" {

            print(print(bundleNameTextField.text))

            return true

        } else {

            return false
        }

    }

    func enterButtonPressed(sender: UIButton!){

        print("FUCK YEAH!")
    }

}
