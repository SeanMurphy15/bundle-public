//
//  LocationVC.swift
//  Bundle
//
//  Created by Sean Murphy on 4/27/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import CoreLocation
import FontAwesome_swift

class MapViewController: UIViewController, MKMapViewDelegate {

	@IBOutlet weak var mapView: MKMapView!

	@IBOutlet weak var backButton: UIBarButtonItem!

	var searchController: UISearchController?
	var resultView: UITextView?
	var selectedLocation: GMSPlace?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Add Location"
		setupSearchBar()
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		backButton.setTitleTextAttributes(attributes, forState: .Normal)
		backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
		self.searchController?.searchBar.becomeFirstResponder()

	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let identifier = segue.identifier {
			switch identifier {
			case "toCreateBundleViewController":
				let navigation = segue.destinationViewController as! UINavigationController
				let createBundleTableViewController = navigation.topViewController as! CreateBundleTableViewController
				createBundleTableViewController.selectedLocation = self.selectedLocation
			default:
				break
			}
		}
	}
}

extension MapViewController: GMSAutocompleteResultsViewControllerDelegate {

	func resultsController(resultsController: GMSAutocompleteResultsViewController,
	                       didAutocompleteWithPlace place: GMSPlace) {
		searchController?.active = false
		mapView.placeAnnotation(place, mapView: mapView, viewController: self, AnnotationTitle: place.name, AnnotationSubTitle: place.formattedAddress) { (success) in
			if success {
				self.selectedLocation = place
				AlertController.threeButtonAlert(viewController: self, alertTitle: place.name, message: "Would you like to add this location to your Bundle?", AlertStyle: .ActionSheet, buttonOneTitle: "Redo", buttonOneAction: .Default, buttonTwoTitle: "Cancel", buttonTwoAction: .Default, buttonThreeTitle: "Add Location", buttonThreeAction: .Cancel) { (buttonOneIsPressed, buttonTwoIsPressed, buttonThreeIsPressed) in
					if buttonOneIsPressed {
						self.searchController?.searchBar.becomeFirstResponder()
					} else if buttonTwoIsPressed {
						self.navigationController?.popViewControllerAnimated(true)
					} else {
						self.performSegueWithIdentifier("toCreateBundleViewController", sender: nil)
					}
				}
			}
		}
	}

	func resultsController(resultsController: GMSAutocompleteResultsViewController,
	                       didFailAutocompleteWithError error: NSError) {
		// TODO: handle the error.
		print("Error: ", error.description)
	}

	func didRequestAutocompletePredictionsForResultsController(resultsController: GMSAutocompleteResultsViewController) {
		UIApplication.sharedApplication().networkActivityIndicatorVisible = true
	}

	func didUpdateAutocompletePredictionsForResultsController(resultsController: GMSAutocompleteResultsViewController) {
		UIApplication.sharedApplication().networkActivityIndicatorVisible = false
	}

	func setupSearchBar() {

		var resultsViewController: GMSAutocompleteResultsViewController?
		resultsViewController = GMSAutocompleteResultsViewController()
		resultsViewController?.delegate = self
		searchController = UISearchController(searchResultsController: resultsViewController)
		searchController?.searchResultsUpdater = resultsViewController
		searchController?.searchBar.sizeToFit()
		self.navigationItem.titleView = searchController?.searchBar
		self.definesPresentationContext = true
		searchController?.hidesNavigationBarDuringPresentation = false
	}

	@IBAction func backButtonPressed(sender: UIBarButtonItem) {
		navigationController?.popViewControllerAnimated(true)
	}

}
