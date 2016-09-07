//
//  ExpirationDatePopUpViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 9/1/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

//
//  TimePopUpViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/18/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

@objc protocol ExpirationDateViewPopUpDelegate{
	optional func ExpirationDateViewPopulateLabelWithTime(label: UILabel, expiration: String, month: String, year: String)
	optional func ExpirationDateViewPopulateTextFieldWithTime(textField: UITextField, expiration: String, month: String, year: String)
}

class ExpirationDatePopUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{


	@IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var expirationYearLabel: UILabel!
	@IBOutlet weak var expirationMonthLabel: UILabel!

	@IBOutlet weak var expirationDatePickerView: UIPickerView!
	@IBOutlet weak var expirationDateView: UIView!

	var labelToChange : UILabel?
	var textFieldToChange : UITextField?
	var delegate : ExpirationDateViewPopUpDelegate?
	var months = ["01","02","03","04","05","06","07","08","09","10","11","12",]
	var years = ["00","00","00","00","00","00",]


 override func viewDidLoad() {
	super.viewDidLoad()




	doneButton.layer.bundleButtonLayerFillAttributes()


	self.showAnimate()
	self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
	expirationDateView.layer.cornerRadius = 5.0
	doneButton.layer.cornerRadius = 5.0
	let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
	view.addGestureRecognizer(tapGesture)
	}


	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		switch component {
		case 0:
			return months.count
		case 1:
			return years.count
		default:
			break
		}
		return 0
	}

	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		switch component {
		case 0:
			return months[row]
		case 1:
			return years[row]
		default:
			break
		}
		return nil
	}

	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 2
	}

	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

		switch component {
		case 0:
			let monthSelected = pickerView.selectedRowInComponent(component)
			let	month = monthSelected.description
			expirationMonthLabel.text = month

		case 1:
			let yearSelected = pickerView.selectedRowInComponent(component)
			let year = yearSelected.description
			expirationYearLabel.text = year
		default:
			break
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}



	func tap(gesture: UITapGestureRecognizer) {
		self.removeAnimate()
	}

	func showAnimate()
	{
		self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
		self.view.alpha = 0.0
		UIView.animateWithDuration(0.25, animations: {
			self.view.alpha = 1.0
			self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
		});
	}

	func removeAnimate()
	{
		UIView.animateWithDuration(0.25, animations: {
			self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
			self.view.alpha = 0.0
			}, completion:{(finished : Bool)  in
				if (finished)
				{
					self.view.removeFromSuperview()
				}
		});
	}
	@IBAction func doneButtonPressed(sender: AnyObject) {
		self.removeAnimate()
		if let label = labelToChange {
			if let year = expirationYearLabel.text{
				if let month = expirationMonthLabel.text{
					delegate?.ExpirationDateViewPopulateLabelWithTime!(label, expiration: "\(year)/\(month)",month:month, year: year)
				}
			}
		} else {
			if let textField = textFieldToChange{
				if let year = expirationYearLabel.text{
					if let month = expirationMonthLabel.text{
						delegate?.ExpirationDateViewPopulateTextFieldWithTime!(textField, expiration: "\(year)/\(month)",month: month, year: year)
					}
				}
			}
		}
	}
}