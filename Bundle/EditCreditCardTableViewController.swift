//
//  EditCreditCardTableVC.swift
//  Bundle
//
//  Created by Sean Murphy on 5/19/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import XMSegmentedControl

class EditCreditCardTableViewController: UITableViewController {

	
	@IBOutlet weak var paymentDefaultSwitch: UISwitch!

	@IBOutlet weak var backButton: UIBarButtonItem!
	@IBOutlet weak var deleteCardButton: UIBarButtonItem!

    @IBOutlet weak var updateCardButton: UIButton!
		@IBOutlet weak var cardExpirationTextField: UITextField!

    @IBOutlet weak var cardAccountHolderNameTextField: UITextField!
    var paymentDefaultChoice = false

    var currentCreditCard : Card?


    override func viewDidLoad() {
        super.viewDidLoad()
			cardExpirationTextField.delegate = self
			cardExpirationTextField.layer.bundleTextFieldLayerAttributes()
			cardAccountHolderNameTextField.layer.bundleTextFieldLayerAttributes()
			cardAccountHolderNameTextField.layer.bundleTextFieldLayerAttributes()

			self.title = "Edit Credit Card"
			self.reactiveKeyboard()
			let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
			deleteCardButton.setTitleTextAttributes(attributes, forState: .Normal)
			deleteCardButton.title = String.fontAwesomeIconWithName(.Trash)
			backButton.setTitleTextAttributes(attributes, forState: .Normal)
			backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
			updateCardButton.layer.bundleTextFieldLayerAttributes()
			tableView.registerNib(UINib(nibName: "ObjectDetailHeaderCell", bundle: nil), forCellReuseIdentifier: "objectDetailHeaderCell")
			tableView.sectionHeaderHeight = UITableViewAutomaticDimension
			tableView.estimatedSectionHeaderHeight = 129.0

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}


	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("objectDetailHeaderCell") as! ObjectDetailHeaderCell
		headerCell.isCardTypeHeader(currentCreditCard!)
		let header = headerCell.contentView
		return header
	}



    @IBAction func deleteCardButtonPressed(sender: AnyObject) {

        AlertController.twoButtonAlert(viewController: self, alertTitle: "Warning", message: "Are you sure you want to delete this account? This can't be undone.", AlertStyle: .Alert, buttonOneTitle: "Confirm", buttonOneAction: .Default, buttonTwoTitle: "Cancel", buttonTwoAction: .Cancel) { (buttonOneIsPressed, buttonTwoIsPressed) in

            if buttonOneIsPressed == true {

                UserController.deleteCommerceMethodByID(self.currentCreditCard?.id!, completion: { (success, messageTitle, message) in

                    if success {

                        AlertController.oneButtonAlert(viewController: self, alertTitle: messageTitle, message: message, buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

                            if buttonPressed == true {

                                print("button pressed")
                            }
                        })

                    } else {

                        AlertController.oneButtonAlert(viewController: self, alertTitle: messageTitle, message: message, buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

                            if buttonPressed == true {

                                print("button pressed")
                            }
                        })
                    }
                })
            }
        }
    }
    @IBAction func updateCreditCardButtonPressed(sender: AnyObject) {

    }

    @IBAction func backButtonPressed(sender: AnyObject) {

        navigationController?.popViewControllerAnimated(true)
    }


}
extension EditCreditCardTableViewController: ExpirationDateViewPopUpDelegate{

	func ExpirationDateViewPopulateTextFieldWithTime(textField: UITextField, expiration: String, month: String, year: String) {
		textField.text = expiration
		//TODO: receives year and month seperately in this function
	}
}

extension EditCreditCardTableViewController: UITextFieldDelegate{

	func textFieldDidBeginEditing(textField: UITextField) {
		switch textField {
		case cardExpirationTextField:
			let expirationDatePopUp = UIStoryboard(name: "ExpirationDatePopUp", bundle: nil).instantiateViewControllerWithIdentifier("expirationDatePopUp") as! ExpirationDatePopUpViewController
			expirationDatePopUp.delegate = self
			expirationDatePopUp.textFieldToChange = cardExpirationTextField
			self.dismissKeyboard()
			self.addChildViewController(expirationDatePopUp)
			expirationDatePopUp.view.frame = tableView.layer.visibleRect
			self.view.addSubview(expirationDatePopUp.view)
			break
		default:
			break
		}
	}
}

