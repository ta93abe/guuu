
import SwiftUI
import Combine
import MapKit


class ShopListViewModel: ObservableObject {
    
    @Published var shops: [ShopViewModel] = [ShopViewModel]()
    
//    init() {
//        fecthShops(range: 2, latitude: 35.65858, longitude: 139.745433)
//    }

    func fecthShops(range: Int, latitude: Double, longitude: Double) {
        ShopData().getData(range: range, latitude: latitude, longitude: longitude) { shops in
            if let shops = shops {
                self.shops = shops.map(ShopViewModel.init)
            }
        }
    }

}


class ShopViewModel: Identifiable {
    
    var id = UUID()
    
    
    var shop: Shop
    
    init(shop: Shop) {
        self.shop = shop
    }
    

    var name: String {
        return self.shop.name!
    }

    var address: String {
        return self.shop.address!
    }

    var tel: String {
        return self.shop.tel!
    }

    var latitude: String {
        return self.shop.latitude!
    }

    var longitude: String {
        return self.shop.longitude!
    }
    
    var openTime: String {
        return self.shop.openTime!
    }
    
    var access: String {
        return self.shop.access.station! + self.shop.access.stationExit! + self.shop.access.walk! + "分"
    }
    
    var image : String {
        let i1 = self.shop.image.image1!
        let i2 = self.shop.image.image2!
        
        if i1 == "" && i2 == "" { return "https://github.com/ta93abe/sample-resource-files/blob/master/kingyo.png?raw=true" }
        if i1 == "" && i2 != "" { return i2 }
        return i1
    }
    
    var cashless : String {
        let s = self.shop.card! + self.shop.eMoney!
        if s == "" { return "現金のみ" }
        else { return s }
    }
    
    var category : String {
        return self.shop.category!
    }
    
}

