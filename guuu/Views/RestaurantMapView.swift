//
//  RestaurantMapView.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/27.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

import SwiftUI
import MapKit

struct RestaurantMapView: UIViewRepresentable {
    
    // MARK: - properties
    var latitude: Double
    var longitude: Double
    
    // MARK: - map view
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let restaurantLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let center = CLLocationCoordinate2D(latitude: latitude-0.001, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: center, span: span)
        uiView.setRegion(region, animated: false)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = restaurantLocation
        uiView.addAnnotation(annotation)

        
    }
    
}

struct RestaurantMapView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantMapView(latitude: 35.65858, longitude: 139.745433)
    }
}
