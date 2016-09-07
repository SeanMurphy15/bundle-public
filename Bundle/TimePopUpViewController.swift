//
//  TimePopUpViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/18/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

@objc protocol TimePopUpDelegate{
	optional func TimeViewPopulateLabelWithTime(label: UILabel, time: String)
	optional func TimeViewPopulateTextFieldWithTime(textField: UITextField, time: String)
	
}

class TimePopUpViewController: UIViewController{

	@IBOutlet weak var doneButton: UIButton!
	@IBOutlet weak var timeView: UIView!
	@IBOutlet weak var timePicker: UIDatePicker!
	@IBOutlet weak var timeLabel: UILabel!
	var labelToChange : UILabel?
	var textFieldToChange : UITextField?
	var delegate : TimePopUpDelegate?

	
 override func viewDidLoad() {
	super.viewDidLoad()

	doneButton.layer.bundleButtonLayerFillAttributes()
	timeLabel.text = ResourceController.currentTime()
	timePicker.datePickerMode = UIDatePickerMode.Time
	timePicker.setValue(UIColor.bundleDarkGrayColor(), forKey: "textColor")
	timePicker.addTarget(self, action: #selector(timePickerChanged(_:)), forControlEvents: .ValueChanged)

	self.showAnimate()
	self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
	timeView.layer.cornerRadius = 5.0
	doneButton.layer.cornerRadius = 5.0
	let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
	view.addGestureRecognizer(tapGesture)
	}

	func timePickerChanged(sender: UIDatePicker){

		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "h:mm:aa"
		timeLabel.text = dateFormatter.stringFromDate(sender.date)


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
			if let time = timeLabel.text{
				delegate?.TimeViewPopulateLabelWithTime!(label, time: time)
			}
		} else {
			if let textField = textFieldToChange {
				if let time = timeLabel.text{
					delegate?.TimeViewPopulateTextFieldWithTime!(textField, time: time)
				}
			}
		}

	}
}