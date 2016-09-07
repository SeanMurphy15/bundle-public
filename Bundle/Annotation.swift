//
//  Annotation.swift
//  Bundle
//
//  Created by Sean Murphy on 5/5/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {

    let title: String?
    let locationAddress: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationAddress: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationAddress = locationAddress
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationAddress
    }
}