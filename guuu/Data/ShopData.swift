import Foundation
import CoreLocation
import MapKit


class ShopData {

    let baseURL = "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=e5947985a13a91c03a6718dcc51e2f96&hit_per_page=23"


    func getData(range: Int, latitude: Double, longitude: Double, card: Int, emoney: Int, takeout: Int, completion: @escaping ([Shop]?) -> ()) {
        guard let url = URL(string: "\(baseURL)&range=\(range)&latitude=\(latitude)&longitude=\(longitude)&card=\(card)&e_money=\(emoney)&takeout=\(takeout)") else {
            completion(nil)
            return
        }


        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            let shopResponse = try? JSONDecoder().decode(ShopResponse.self, from: data)

            if let shopResponse = shopResponse {
                let shops = shopResponse.rest
                DispatchQueue.main.async {
                    completion(shops)
                }
            } else {
                completion(nil)
            }
        }
        .resume()
    }
}
