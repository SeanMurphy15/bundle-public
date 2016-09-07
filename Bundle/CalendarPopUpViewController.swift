//
//  CalendarPopoverViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/17/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import CalendarView
import SwiftMoment

@objc protocol CalendarPopUpDelegate{
	optional func CalendarViewPopulateLabelWithDate(label: UILabel, date: String)
	optional func CalendarViewPopulateTextFieldWithDate(textfield: UITextField, date: String)
}

class CalendarPopUpViewController: UIViewController, CalendarViewDelegate {

	@IBOutlet weak var doneButton: UIButton!

	@IBOutlet weak var calendarFrame: UIView!
	@IBOutlet weak var monthLabel: UILabel!
	@IBOutlet weak var calendarView: UIView!
	var delegate : CalendarPopUpDelegate?
	var labelToChange : UILabel?
	var textFieldToChange : UITextField?
	override func viewDidLoad() {
		super.viewDidLoad()

		self.showAnimate()
		self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
		let calendar = CalendarView(frame: CGRectMake(0, monthLabel.frame.height, CGRectGetWidth(calendarView.frame), 288))
		calendarView.layer.cornerRadius = 5.0
		doneButton.layer.cornerRadius = 5.0
		CalendarView.daySelectedBackgroundColor = UIColor.bundleDarkGrayColor()
		CalendarView.daySelectedTextColor = UIColor.whiteColor()
		CalendarView.todayBackgroundColor = UIColor.whiteColor()
		CalendarView.todayTextColor = UIColor.bundleDarkYellowColor()
		CalendarView.dayTextColor = UIColor.bundleDarkGrayColor()
		CalendarView.dayBackgroundColor = UIColor.whiteColor()
		CalendarView.weekLabelTextColor = UIColor.bundleDarkGrayColor()
		calendarView.addSubview(calendar)
		calendar.delegate = self
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
		view.addGestureRecognizer(tapGesture)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func tap(gesture: UITapGestureRecognizer) {
		self.removeAnimate()
	}

	func calendarDidSelectDate(date: Moment) {
		title = date.format("MMMM d, yyyy")
		monthLabel.text = title
	}

	func calendarDidPageToDate(date: Moment) {
		monthLabel.text = date.format("MMMM")

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
		if let label = labelToChange{
			if let dateString = title {
				delegate?.CalendarViewPopulateLabelWithDate!(label, date: dateString)
			}
		} else {
			if let textField = textFieldToChange {
				if let dateString = title {
					delegate?.CalendarViewPopulateTextFieldWithDate!(textField, date: dateString)
				}
			}
		}
		removeAnimate()
	}
}
