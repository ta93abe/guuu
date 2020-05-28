//
//  RestaurantDetail.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/22.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

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
                        Text("住所").foregroundColor(Color.gray)
                        Spacer()
                        Text(address)
                    }
                    VStack(alignment: .leading) {
                        Text("電話番号").foregroundColor(Color.gray)
                        Spacer()
                        Text(tel)
                    }
                    VStack(alignment: .leading) {
                        Text("営業時間").foregroundColor(Color.gray)
                        Spacer()
                        Text(open)
                    }
                
                }
            }
            .padding(.top, -50)
        }
    }
}



struct RestaurantDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetail(shopName: "ここ", address: "住所", tel: "電話番号", open: "営業時間", latitude: 35.65858, longitude: 139.745433, image: "")
    }
}
