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


