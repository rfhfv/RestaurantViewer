import Foundation

struct YelpSearchResponse: Decodable {
    let businesses: [Restaurant]
}
