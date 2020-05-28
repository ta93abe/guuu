//
//  RestaurantAnnotation.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/24.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

import Foundation
import MapKit


final class RestaurantAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    init(restaurant: Restaurant) {
        self.title = restaurant.name
        self.coordinate = restaurant.coordinate
    }
    
    
    
    
}


