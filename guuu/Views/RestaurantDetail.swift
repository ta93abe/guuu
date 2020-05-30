import SwiftUI
import MapKit
import URLImage

struct RestaurantDetail: View {
    
    var shopName: String
    var address: String
    var tel: String
    var open: String
    var latitude: Double
    var longitude: Double
    var image : String
    var payment : String
    var category : String
    
    var body: some View {
        VStack {
            RestaurantMapView(latitude: latitude, longitude: longitude)
                .frame(height: 300, alignment: .top)
                .edgesIgnoringSafeArea(.top)
            
            URLImage(URL(string: image)!) { proxy in
                proxy.image
                .resizable()
            }
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 10))
                .offset(y: -225)
                .padding(.bottom, -100)
            
            Text(shopName)
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .offset(y: -100)
            
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
