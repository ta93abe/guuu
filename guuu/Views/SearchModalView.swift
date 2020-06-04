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
    
    @State private var selectPayment : Int = 1
    let payments = ["現金のみ", "キャッシュレス可"]
    
    @State private var selectedPayment: Bool = false
    @State private var selectedTakeout: Bool = false
    
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
                    Section(header: Text("ここから歩いて")) {
                       Picker(selection: $selectedTime, label: Text("徒歩")) {
                          Text(self.colors[0]).tag(0)
                          Text(self.colors[1]).tag(1)
                          Text(self.colors[2]).tag(2)
                       }
                       .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("支払い")) {
                        Toggle(isOn: $selectedPayment) {
                            Text("キャッシュレス")
                        }
                    }
                
                    Section(header: Text("テイクアウト")) {
                        Toggle(isOn: $selectedTakeout) {
                            Text("テイクアウトあり")
                        }
                    }
                }

                Button(action: {
                    let range = self.selectedTime + 2
                    let myLocation = self.locationManager.location?.coordinate
                    let pay = self.selectedPayment ? 1 : 0
                    let takeout = self.selectedTakeout ? 1 : 0
                    self.getNearByRestaurants()
                    self.getNearByShops()
                    self.showModal.toggle()
                    self.showList = true
                    self.shopsSearch.fetchShops(range: range, latitude: myLocation!.latitude, longitude: myLocation!.longitude,
                                                payments: pay, takeout: takeout)

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

