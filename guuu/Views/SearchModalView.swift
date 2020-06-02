import SwiftUI
import MapKit


struct SearchModalView: View {
    
    
    // MARK: - properties
    @Binding var restaurants : [Restaurant]
    @Binding var shopPins : [ShopPins]
    @Binding var showModal : Bool
    @Binding var showList : Bool
    @ObservedObject private var locationManager = LocationManager()
    @State private var search: String = ""
    
    let shopsSearch : ShopListViewModel
    
    @State private var selectedTime : Int = 0
    let colors = ["5分", "10分", "20分"]
    
    // MARK: - function
    private func getNearByRestaurants() {
        guard let location = self.locationManager.location else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.search
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response, error == nil else {
                return
            }
            let mapItems = response.mapItems
            self.restaurants = mapItems.map {
                Restaurant(placemark: $0.placemark)
            }
        }
    }
    
    private func getNearByShops() {
        
    }
    
    // MARK: - view
    var body: some View {
            VStack {
                Text("検索条件")
                    .font(.system(size: 36, weight: .bold))
                    .padding()
                
                Form {
                    Section(header: Text("ここから歩いて \(selectedTime)")) {
                       Picker(selection: $selectedTime, label: Text("徒歩")) {
                          Text(self.colors[0]).tag(0)
                          Text(self.colors[1]).tag(1)
                          Text(self.colors[2]).tag(2)
                       }
                       .pickerStyle(SegmentedPickerStyle())
                    }
                
                    Section(header: Text("キーワード検索")) {
                        TextField("キーワード検索", text: self.$search, onEditingChanged: { _ in }) {
                            self.getNearByRestaurants()
                        }
                    }
                }

                Button(action: {
                    let range = self.selectedTime + 2
                    let myLocation = self.locationManager.location?.coordinate
                    self.getNearByRestaurants()
                    self.getNearByShops()
                    self.showModal.toggle()
                    self.showList = true
                    self.shopsSearch.fetchShops(range: range, latitude: myLocation!.latitude, longitude: myLocation!.longitude)
//                    print(myLocation!.latitude)
//                    print(myLocation!.longitude)
//                    print(range)
                }) {
                    
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
        }
            .padding(.vertical)
    }
}

