//
//  MKMapViewExtension.swift
//  Bundle
//
//  Created by Sean Murphy on 8/19/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import GoogleMaps

extension MKMapView {

	func placeAnnotation(place: GMSPlace, mapView: MKMapView, viewController: UIViewController, AnnotationTitle: String, AnnotationSubTitle: String?, completion:(success: Bool)->Void){

		let location = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
		let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000 * 2.0, 2000 * 2.0)
		mapView.setRegion(coordinateRegion, animated: true)
		if let subtitle = AnnotationSubTitle {
			let annotation = Annotation(title: AnnotationTitle, locationAddress: subtitle, coordinate: CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude))
			mapView.addAnnotation(annotation)
			mapView.selectAnnotation(annotation, animated: true)
			completion(success: true)

		} else {

			let annotation = Annotation(title: AnnotationTitle, locationAddress: "", coordinate: CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude))
			mapView.addAnnotation(annotation)
			mapView.selectAnnotation(annotation, animated: true)
			completion(success: true)
		}
		
	}
	
}