//
//  ContentView.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/22.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var showModal: Bool = false
    @State private var restaurants = [Restaurant]()
    @State private var showList : Bool = false
    @State private var shopPins = [ShopPins]()
    
    @ObservedObject private var shopListVM = ShopListViewModel()

    var body: some View {
        ZStack(alignment: .top) {
             
            MapView(restaurants: self.restaurants, shopPins: self.shopPins).edgesIgnoringSafeArea(.all)
            
            Text("guuu")
                .font(Font.title.italic())
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            
            QueryListView(shops: self.shopListVM.shops, showList: self.$showList).offset(y: showList ? 0 : 1000)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.white)
                            .shadow(radius: 20)
                        Button(action: {
                            self.showModal.toggle()
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 30))
                        }.sheet(isPresented: $showModal) {
                            SearchModalView(
                                restaurants: self.$restaurants,
                                shopPins: self.$shopPins,
                                showModal: self.$showModal,
                                showList: self.$showList,
                                shopsSearch: self.shopListVM
                                
                            )
                        }
                    }
                }
            .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
              .previewDisplayName("iPhone SE")
        }
    }
}

