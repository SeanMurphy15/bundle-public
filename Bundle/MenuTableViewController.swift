
//  SideMenuTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/5/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
	@IBOutlet weak var homeIconImageView: UIImageView!

	@IBOutlet weak var createBundleIconImageView: UIImageView!

	@IBOutlet weak var bundlesIconImageView: UIImageView!

	@IBOutlet weak var accountIconImageView: UIImageView!

	@IBOutlet weak var transactionsIconImageView: UIImageView!

	@IBOutlet weak var aboutUsIconImageView: UIImageView!

	@IBOutlet weak var getInTouchIconImageView: UIImageView!

	@IBOutlet weak var logoutIconImageView: UIImageView!

	var currentUser: User?

	@IBOutlet weak var currentUserEmailLabel: UILabel!
	@IBOutlet weak var userProfileHeaderView: UIView!
	@IBOutlet weak var currentUserUsernameLabel: UILabel!
	@IBOutlet weak var userImageView: UIImageView! {

		didSet {

			userImageView.createCircularImageWithWhiteBorder()
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.separatorColor = UIColor.bundleMediumGrayColor().colorWithAlphaComponent(0.2)
		homeIconImageView.image = UIImage.fontAwesomeIconWithName(.Home, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		createBundleIconImageView.image = UIImage.fontAwesomeIconWithName(.Plus, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		bundlesIconImageView.image = UIImage.fontAwesomeIconWithName(.Ticket, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		accountIconImageView.image = UIImage.fontAwesomeIconWithName(.User, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		transactionsIconImageView.image = UIImage.fontAwesomeIconWithName(.Dollar, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		aboutUsIconImageView.image = UIImage.fontAwesomeIconWithName(.InfoCircle, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		getInTouchIconImageView.image = UIImage.fontAwesomeIconWithName(.Envelope, textColor: UIColor.bundleMediumGrayColor(), size: CGSizeMake(50, 50))
		logoutIconImageView.image = UIImage.fontAwesomeIconWithName(.SignOut, textColor: UIColor.bundlePinkColor(), size: CGSizeMake(50, 50))

		UserController.fetchCurrentUser { (success, user) in
			if success {
				if let user = user {

					self.currentUser = user
					self.currentUserEmailLabel.text = self.currentUser?.email
					self.currentUserUsernameLabel.text = self.currentUser?.firstName

				}
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableView.backgroundColor = UIColor.bundleDarkGrayColor()
		return 9
	}

	@IBAction func logoutButtonPressed(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}
