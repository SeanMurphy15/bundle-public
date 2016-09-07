//
//  LoginVC.swift
//  Bundle
//
//  Created by Sean Murphy on 6/6/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import AVFoundation
import FontAwesome_swift


class LoginViewController: UIViewController, UITextFieldDelegate {


	var loginAttempts = 0

	@IBOutlet weak var facebookButton: UIButton!


	@IBOutlet weak var googleButton: UIButton!

	@IBOutlet weak var forgotPasswordButton: UIButton!

	@IBOutlet weak var emailTextField: UITextField!

	@IBOutlet weak var passwordTextField: UITextField!

	@IBOutlet weak var loginButton: UIButton!

	@IBOutlet weak var signupButton: UIButton!


	override func viewDidLoad() {

		self.reactiveKeyboard()
		emailTextField.delegate = self
		passwordTextField.delegate = self
		emailTextField.text = "2@gmail.com"
		passwordTextField.text = "123"
		emailTextField.layer.bundleTextFieldLayerAttributes()
		passwordTextField.layer.bundleTextFieldLayerAttributes()
		forgotPasswordButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
		forgotPasswordButton.setTitle(String.fontAwesomeIconWithName(.Question), forState: .Normal)
		facebookButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
		facebookButton.setTitle(String.fontAwesomeIconWithName(.FacebookF), forState: .Normal)
		googleButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
		googleButton.setTitle(String.fontAwesomeIconWithName(.Google), forState: .Normal)
		googleButton.layer.bundleButtonLayerFillAttributes()
		facebookButton.layer.bundleButtonLayerFillAttributes()
		loginButton.layer.bundleButtonLayerFillAttributes()

	}
	@IBAction func signupButtonPressed(sender: AnyObject) {

		self.performSegueWithIdentifier("toSignupViewController", sender: nil)
	}

	func textFieldDidBeginEditing(textField: UITextField) {
	}

	func textFieldDidEndEditing(textField: UITextField) {
	}


	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func facebookButtonPressed(sender: AnyObject) {
	}
	@IBAction func googleButtonPressed(sender: AnyObject) {
	}

	@IBAction func loginButtonPressed(sender: AnyObject) {


		if loginAttempts < 3 {

			if emailTextField.text != "" {


				if passwordTextField.text != "" {

					UserController.loginUser(emailTextField.text!, password: passwordTextField.text!, completion: { (success, messageTitle, message, authToken) in

						if success {
							dispatch_async(dispatch_get_main_queue()) {
							let vc = UIStoryboard(name: "Menu", bundle: nil).instantiateViewControllerWithIdentifier("main") as! SWRevealViewController
							self.presentViewController(vc, animated: true, completion: nil)
							}
						} else {

							self.loginAttempts += 1

							AlertController.oneButtonAlert(viewController: self, alertTitle: messageTitle, message: message, buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

								if buttonPressed == true {

									self.emailTextField.becomeFirstResponder()
									self.passwordTextField.text = ""
								}
							})
						}
					})

				} else {

					AlertController.oneButtonAlert(viewController: self, alertTitle: "Password Required", message: "A password is required to access your account!", buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

						if buttonPressed == true {

							self.passwordTextField.becomeFirstResponder()
						}
					})
				}

			} else {

				AlertController.oneButtonAlert(viewController: self, alertTitle: "Email Required", message: "An email is required to access your account!", buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

					if buttonPressed == true {

						self.emailTextField.becomeFirstResponder()
					}
				})
			}
		} else {

			promptPasswordResetEmailAlert(emailTextField.text!)

		}
	}

	@IBAction func forgotPasswordButtonPressed(sender: AnyObject) {
	}



	func promptPasswordResetEmailAlert(emailTextFieldText: String) {



		AlertController.twoButtonAlertWithOneTextField(viewController: self, alertTitle: "Exceeded Login Attempts!", message: "Would you like to reset your password? A password reset token can be sent to the following email:", AlertStyle: .Alert, buttonOneTitle: "OK", buttonOneAction: .Default, buttonTwoTitle: "Retry", buttonTwoAction: .Cancel, alertTextFieldText: emailTextFieldText, alertTextFieldPlaceHolder: nil) { (buttonOneIsPressed, buttonTwoIsPressed, alertTextField) in

			if buttonOneIsPressed == true {

				if alertTextField.text != "" {

					UserController.emailUserPasswordToken(alertTextField.text!, completion: { (success, messageTitle, message) in

						if success {

							AlertController.oneButtonAlert(viewController: self, alertTitle: messageTitle, message: message, buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

								if buttonPressed == true {

									//TODO: take user to their email?
								}
							})
						} else {

							AlertController.oneButtonAlert(viewController: self, alertTitle: messageTitle, message: message, buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in


								if buttonPressed == true {

									//TODO: the email was unsuccesfull in the alert's test field
								}
							})

						}
					})
				} // no alert for blank alert text field

			} else if buttonTwoIsPressed == true {

				self.loginAttempts = 0
				self.emailTextField.becomeFirstResponder()
				self.emailTextField.text = ""
				self.passwordTextField.text = ""
			}
		}
	}
}
