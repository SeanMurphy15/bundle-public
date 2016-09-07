//
//  AlertController.swift
//  Bundle
//
//  Created by Sean Murphy on 5/14/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit


class AlertController{



    static func oneButtonAlert(viewController viewController: UIViewController, alertTitle: String, message: String, buttonTitle: String, AlertStyle: UIAlertControllerStyle, completion:(buttonPressed: Bool)->Void){

        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: AlertStyle)
        let button = UIAlertAction(title: buttonTitle, style: .Default) { (_) in

            completion(buttonPressed: true)
        }

        alert.addAction(button)

        viewController.presentViewController(alert, animated: true, completion: nil)
    }


    static func twoButtonAlert(viewController viewController: UIViewController, alertTitle: String, message: String, AlertStyle: UIAlertControllerStyle, buttonOneTitle: String, buttonOneAction: UIAlertActionStyle, buttonTwoTitle: String, buttonTwoAction: UIAlertActionStyle, completion:(buttonOneIsPressed: Bool, buttonTwoIsPressed: Bool)->Void){


        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: AlertStyle)
        let buttonOne = UIAlertAction(title: buttonOneTitle, style: buttonOneAction) { (_) in

            completion(buttonOneIsPressed: true, buttonTwoIsPressed: false)
        }

        let buttonTwo = UIAlertAction(title: buttonTwoTitle, style: buttonTwoAction) { (_) in

            completion(buttonOneIsPressed: false, buttonTwoIsPressed: true)
        }

        alert.addAction(buttonOne)
        alert.addAction(buttonTwo)

        viewController.presentViewController(alert, animated: true, completion: nil)

    }

    static func threeButtonAlert(viewController viewController: UIViewController, alertTitle: String, message: String, AlertStyle: UIAlertControllerStyle, buttonOneTitle: String, buttonOneAction: UIAlertActionStyle, buttonTwoTitle: String, buttonTwoAction: UIAlertActionStyle, buttonThreeTitle: String, buttonThreeAction: UIAlertActionStyle, completion:(buttonOneIsPressed: Bool, buttonTwoIsPressed: Bool, buttonThreeIsPressed: Bool)->Void){


        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: AlertStyle)

        let buttonOne = UIAlertAction(title: buttonOneTitle, style: buttonOneAction) { (_) in

            completion(buttonOneIsPressed: true, buttonTwoIsPressed: false, buttonThreeIsPressed: false)
        }

        let buttonTwo = UIAlertAction(title: buttonTwoTitle, style: buttonTwoAction) { (_) in

            completion(buttonOneIsPressed: false, buttonTwoIsPressed: true, buttonThreeIsPressed: false)
        }

        let buttonThree = UIAlertAction(title: buttonThreeTitle, style: buttonThreeAction) { (_) in

            completion(buttonOneIsPressed: false, buttonTwoIsPressed: false, buttonThreeIsPressed: true)
        }

        alert.addAction(buttonOne)
        alert.addAction(buttonTwo)
        alert.addAction(buttonThree)


        viewController.presentViewController(alert, animated: true, completion: nil)
        
    }

    static func twoButtonAlertWithOneTextField(viewController viewController: UIViewController, alertTitle: String, message: String, AlertStyle: UIAlertControllerStyle, buttonOneTitle: String, buttonOneAction: UIAlertActionStyle, buttonTwoTitle: String, buttonTwoAction: UIAlertActionStyle, alertTextFieldText: String?, alertTextFieldPlaceHolder: String?, completion:(buttonOneIsPressed: Bool, buttonTwoIsPressed: Bool, alertTextField: UITextField)->Void){


        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: AlertStyle)

        alert.addTextFieldWithConfigurationHandler { (alertTextField) in
            alertTextField.text = alertTextFieldText
            alertTextField.placeholder = alertTextFieldPlaceHolder

            let buttonOne = UIAlertAction(title: buttonOneTitle, style: buttonOneAction) { (_) in

                completion(buttonOneIsPressed: true, buttonTwoIsPressed: false, alertTextField: alertTextField)
            }

            let buttonTwo = UIAlertAction(title: buttonTwoTitle, style: buttonTwoAction) { (_) in

                completion(buttonOneIsPressed: false, buttonTwoIsPressed: true, alertTextField: alertTextField)
            }

            alert.addAction(buttonOne)
            alert.addAction(buttonTwo)

            viewController.presentViewController(alert, animated: true, completion: nil)
        }


        
    }
}











