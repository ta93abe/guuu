import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let restaurants: [Restaurant]
    let shopPins : [ShopPins]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.restaurants.map(RestaurantAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
    private func updateShopAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.shopPins.map(ShopAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}



