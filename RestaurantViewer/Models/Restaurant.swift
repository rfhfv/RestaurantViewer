import Foundation

struct Restaurant: Decodable, Identifiable {
    let id: String
    let name: String
    let imageUrl: String
    let rating: Double
    
    enum CondingKeys: String, CodingKey {
        case id, name, rating
        case imageUrl = "image_url"
    }
}
