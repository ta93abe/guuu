import SwiftUI
import MapKit
import URLImage

struct RestaurantDetail: View {
    
    
    // MARK: - properties
    var shopName: String
    var address: String
    var tel: String
    var open: String
    var latitude: Double
    var longitude: Double
    var image : String
    var payment : String
    var category : String
    
    @ObservedObject private var locationManager = LocationManager()

    
    // MARK: - function
    func distanceFromHere(latitude: Double, longitude: Double) -> CLLocationDistance {
        let currentLoc: CLLocation = self.locationManager.location!
        let restLoc: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        let dist = restLoc.distance(from: currentLoc)
        return dist
    }
    
    
    // MARK: - view
    var body: some View {
            VStack {
                RestaurantMapView(latitude: latitude, longitude: longitude)
                    .frame(height: 250, alignment: .top)
                    .edgesIgnoringSafeArea(.top)
                        
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 210, height: 210, alignment: .center)
                    URLImage(URL(string: image)!) { proxy in
                                proxy.image
                                .resizable()
                            }
                                .frame(width: 200, height: 200, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 10))
                    
                }
                .offset(y: -225)
                .padding(.bottom, -100)

                        Text(shopName)
                            .font(.body)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                            .offset(y: -100)
                        HStack {
                            Spacer()
                            Text("ここから歩いて\(Int(distanceFromHere(latitude: latitude, longitude: longitude)))m")
                                .font(.footnote)
                                .foregroundColor(.green)
                                .offset(y: -50)
                                .padding(.horizontal, 10)
                        }
                        
                        
                        
                        
                        Form {
                            Section(header: Text("店舗情報")) {
                                VStack(alignment: .leading) {
                                    Text("カテゴリー").foregroundColor(Color.gray)
                                    Spacer()
                                    Text(category)
                                }
                                VStack(alignment: .leading) {
                                    Text("営業時間").foregroundColor(Color.gray)
                                    Spacer()
                                    Text(open)
                                }
                                VStack(alignment: .leading) {
                                    Text("支払い方法").foregroundColor(Color.gray)
                                    Spacer()
                                    Text(payment)
                                }
                                VStack(alignment: .leading) {
                                    Text("住所").foregroundColor(Color.gray)
                                    Spacer()
                                    Text(address)
                                }
                                VStack(alignment: .leading) {
                                    Text("電話番号").foregroundColor(Color.gray)
                                    Spacer()
                                    Text(tel)
                                }
                                
                            }
                        }
                        .padding(.top, -50)
                    }
        
        
    }
}
