//
//  SignupVC.swift
//  Bundle
//
//  Created by Sean Murphy on 6/6/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var exitButton: UIButton!

	var termsAndConditionsChoice = false

	@IBOutlet weak var gifView: UIWebView!

	@IBOutlet weak var termsAndConditionsButton: UIButton!
	@IBOutlet weak var facebookButton: UIButton!

	@IBOutlet weak var googleButton: UIButton!
	@IBOutlet weak var emailTextField: UITextField!

	@IBOutlet weak var passwordTextField: UITextField!

	@IBOutlet weak var signupButton: UIButton!
	@IBOutlet weak var confirmPasswordTextField: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()


		passwordTextField.delegate = self
		confirmPasswordTextField.delegate = self
		emailTextField.delegate = self

		self.reactiveKeyboard()
		emailTextField.delegate = self
		passwordTextField.delegate = self
		emailTextField.layer.bundleTextFieldLayerAttributes()
		passwordTextField.layer.bundleTextFieldLayerAttributes()
		confirmPasswordTextField.layer.bundleTextFieldLayerAttributes()
		facebookButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
		facebookButton.setTitle(String.fontAwesomeIconWithName(.FacebookF), forState: .Normal)
		googleButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
		googleButton.setTitle(String.fontAwesomeIconWithName(.Google), forState: .Normal)
		exitButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
		exitButton.setTitle(String.fontAwesomeIconWithName(.Close), forState: .Normal)

		signupButton.layer.bundleButtonLayerFillAttributes()
		googleButton.layer.bundleButtonLayerFillAttributes()
		facebookButton.layer.bundleButtonLayerFillAttributes()

		//			let filePath = NSBundle.mainBundle().pathForResource("login-video", ofType: "gif")
		//			let gif = NSData(contentsOfFile: filePath!)
		//			gifView.loadData(gif!, MIMEType: "image/gif", textEncodingName: "utf-8", baseURL: NSURL())
		//			gifView.userInteractionEnabled = false
		//			gifView.alpha = 0.1
		//			gifView.opaque = false
		//			gifView.scrollView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
		//			gifView.clipsToBounds = true
		//			gifView.layer.backgroundColor = UIColor.clearColor().CGColor


	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	@IBAction func termsAndConditionsButtonPressed(sender: AnyObject) {

		self.performSegueWithIdentifier("toTermsAndConditionsVC", sender: nil)
	}

	@IBAction func facebookButtonPressed(sender: AnyObject) {
	}
	@IBAction func googleButtonPressed(sender: AnyObject) {
	}

	@IBAction func exitButtonPressed(sender: AnyObject) {

		self.dismissViewControllerAnimated(true, completion: nil)
	}


	@IBAction func signupButtonPressed(sender: AnyObject) {

		if termsAndConditionsChoice == true {

			UserController.registerUser(emailTextField.text!, password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!, termsAndConditions: termsAndConditionsChoice, completion: { (success, messageTitle, message) in

				if success {

					self.performSegueWithIdentifier("toMenuTableVC", sender: nil)

				} else {

					AlertController.oneButtonAlert(viewController: self, alertTitle: messageTitle, message: message, buttonTitle: "OK", AlertStyle: .Alert, completion: { (buttonPressed) in

					})
				}
			})

		} else {

			AlertController.twoButtonAlert(viewController: self, alertTitle: "Terms And Conditions", message: "In order to continue, you must agree to Bundle's \"Terms And Conditions\".", AlertStyle: .Alert, buttonOneTitle: "Read", buttonOneAction: .Default, buttonTwoTitle: "OK", buttonTwoAction: .Cancel, completion: { (buttonOneIsPressed, buttonTwoIsPressed) in

				if buttonOneIsPressed{

					self.performSegueWithIdentifier("toTermsAndConditionsVC", sender: nil)

				}
			})
		}


	}
}









