import SwiftUI

struct QueryListView: View {
    let shops: [ShopViewModel]
    @Binding var showList : Bool
    
//    init(shops: [ShopViewModel]) {
//        self.shops = shops
//    }
    
    var body: some View {
        NavigationView {
            List(self.shops, id: \.id) { shop in
                NavigationLink(destination: RestaurantDetail(shopName: shop.name, address: shop.address, tel: shop.tel, open: shop.openTime, latitude: Double(shop.latitude)!, longitude: Double(shop.longitude)!, image: shop.image, payment: shop.cashless, category: shop.category)) {
                    QueryCard(title: shop.name, access: shop.access, image: shop.image)
                        .padding()
                }
            }
            .navigationBarTitle(Text("検索結果"))
            .navigationBarItems(leading: Button(action: {
                self.showList = false
            }, label: {
                Image(systemName: "arrow.left")
            }))

        }
    }
}
