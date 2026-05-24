import Foundation

protocol RestaurantAPIProtocol {
    func fetchRestaurants(latitude: Double, longitude: Double, limit: Int,
                          offset: Int, completion: @escaping ([Restaurant]) -> Void)
}

final class YelpAPI: RestaurantAPIProtocol {
    static let apiKey = APIConfig.apiKey
    
    func fetchRestaurants(latitude: Double, longitude: Double, limit: Int, offset: Int, completion: @escaping ([Restaurant]) -> Void) {
        let urlString = "https://api.yelp.com/v3/businesses/search?term=restaurants&latitude=\(latitude)&longitude=\(longitude)&limit=\(limit)&offset=\(offset)"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(YelpAPI.apiKey)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(YelpSearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result.businesses)
                }
            } catch {
                print("Error decoding: ", error)
            }
        }.resume()
    }
}
