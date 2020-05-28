import Foundation

struct ShopResponse : Codable {
    var rest: [Shop]
}

struct Shop : Codable {
    var name: String?
    var address: String?
    var tel: String?
    var latitude: String?
    var longitude: String?
    var openTime: String?
    var access : Access
    var image : ImageURL
    
    enum CodingKeys: String, CodingKey {
        case name
        case address
        case tel
        case latitude
        case longitude
        case openTime = "opentime"
        case access
        case image = "image_url"
    }
    
    
    struct Access : Codable {
        var station : String?
        var stationExit : String?
        var walk: String?
        
        enum CodingKeys: String, CodingKey {
            case station
            case stationExit = "station_exit"
            case walk
        }
    }
    struct ImageURL : Codable {
        var image1 : String?
        var image2 : String?
        
        enum CodingKeys : String, CodingKey {
            case image1 = "shop_image1"
            case image2 = "shop_image2"
        }
        
    }
}
