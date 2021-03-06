//
//  NotificationsTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/27/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class NotificationsTableViewController: UITableViewController {

	@IBOutlet weak var exitButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
			let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
			exitButton.setTitleTextAttributes(attributes, forState: .Normal)
			exitButton.title = String.fontAwesomeIconWithName(.Close)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

			self.title = "Notifications"
			tableView.emptyDataSetSource = self
			tableView.emptyDataSetDelegate = self
			tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	@IBAction func exitButtonPressed(sender: AnyObject) {

		self.dismissViewControllerAnimated(true, completion: nil)
	}

}

extension NotificationsTableViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

	func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
		let image = UIImage(named: "bell-slash")!.maskWithColor(UIColor.bundleDarkGrayColor().colorWithAlphaComponent(0.1))
		self.view.backgroundColor = UIColor.bundleLightGrayColor()
		return image
	}

	func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
		let str = "You don't have any recent notifications."
		let attrs = [NSFontAttributeName: UIFont(
			name: "Raleway-Regular",
			size: 20.0)!]
		return NSAttributedString(string: str, attributes: attrs)
	}

}
