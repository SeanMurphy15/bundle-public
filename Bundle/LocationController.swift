//
//  LocationController.swift
//  Bundle
//
//  Created by Sean Murphy on 5/5/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
import UIKit
import GoogleMaps

class locationController{

    static func placeAnnotation(place: GMSPlace, mapView: MKMapView, viewController: UIViewController, AnnotationTitle: String, AnnotationSubTitle: String, completion:(success: Bool)->Void){

        let location = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000 * 2.0, 2000 * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        let annotation = Annotation(title: AnnotationTitle, locationAddress: AnnotationSubTitle,coordinate: CLLocationCoordinate2D(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude))
            mapView.addAnnotation(annotation)
            mapView.selectAnnotation(annotation, animated: true)
        completion(success: true)
    }

    static func geocodeCoordinates(place: GMSPlace, completion: (success: Bool) -> Void) {

        let longitude = place.coordinate.longitude
        let latitude = place.coordinate.latitude

			//some stuff
        let location = CLLocationCoordinate2DMake(latitude, longitude)

        GMSGeocoder().reverseGeocodeCoordinate(location) { (response, error) in

            if error != nil{

                print(error.debugDescription)
                completion(success: false)

            } else if response?.firstResult() != nil{


                if let data = response?.firstResult()!{

                    if let postalAddressCity = data.locality
                    {LocalDataController.saveLocalString(postalAddressCity, key: "postalAddressCity")}
                    else{LocalDataController.saveLocalString("", key: "postalAddressCity")}

                    if let postalAddressState = data.administrativeArea
                    {LocalDataController.saveLocalString(postalAddressState, key: "postalAddressState")}
                    else{LocalDataController.saveLocalString("", key: "postalAddressState")}

                    if let postalAddressCountry = data.country
                    {LocalDataController.saveLocalString(postalAddressCountry, key: "postalAddressCountry")}
                    else{LocalDataController.saveLocalString("", key: "postalAddressCountry")}

                    if let postalAddressPostalCode = data.postalCode
                    {LocalDataController.saveLocalString(postalAddressPostalCode, key: "postalAddressPostalCode")}
                    else{LocalDataController.saveLocalString("", key: "postalAddressPostalCode")}

                    if let postalAddressStreet = data.thoroughfare
                    {LocalDataController.saveLocalString(postalAddressStreet, key: "postalAddressStreet")
                    }else {
                        LocalDataController.saveLocalString("", key: "postalAddressStreet")
                    }

                    if place.name != ""{
                        LocalDataController.saveLocalString(place.name, key: "postalAddressName")
                    }else{
                        LocalDataController.saveLocalString("", key: "postalAddressName")
                    }

                    //PROVIDED DATA POINTS

                    LocalDataController.saveLocalDouble(longitude, key: "postalAddressLongitude")
                    LocalDataController.saveLocalDouble(latitude, key: "postalAddressLatitude")
                    LocalDataController.saveLocalDouble(longitude, key: "bundleEventLongitude")
                    LocalDataController.saveLocalDouble(latitude, key: "bundleEventLatitude")


                    //UNUSED DATA POINTS

                    LocalDataController.saveLocalString("", key: "postalAddressStreetNumber")
                    LocalDataController.saveLocalInt(0, key: "postalAddressID")
                    LocalDataController.saveLocalString("", key: "postalAddressFirstName")
                    LocalDataController.saveLocalString("", key: "postalAddressLastName")
                    LocalDataController.saveLocalString("", key: "postalAddressUnit")
                    
                    completion(success: true)
                }
            }
        }
    }

}