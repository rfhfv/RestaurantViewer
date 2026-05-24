import Foundation
import SwiftUI

final class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var currentIndex = 0
    @Published var animateCard = false
    @Published var slideDirection: CGFloat = -300
    @Published var isLoading = false
    @Published var offset = 0
    @Published var limit = 5
    
    let restaurantService: RestaurantAPIProtocol
    
    init(restaurantService: RestaurantAPIProtocol) {
        self.restaurantService = restaurantService
    }
    
    func loadMoreRestaurants(lat: Double, long: Double) {
        guard !isLoading else { return }
        isLoading = true
        
        restaurantService.fetchRestaurants(latitude: lat, longitude: long, limit: limit, offset: offset) { [weak self] data in
            DispatchQueue.main.async {
                guard let self else { return }
                self.restaurants.append(contentsOf: data)
                self.offset += self.limit
                self.isLoading = false
            }
        }
    }
    
    func showNext() {
        guard currentIndex < restaurants.count - 1  else { return }
        slideDirection = -300
        withAnimation(.easeInOut(duration: 0.3)) {
            self.animateCard = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self else { return }
            self.animateCard = false
            self.currentIndex += 1
        }
    }
    
    func showPrevious() {
        guard currentIndex > 0 else { return }
        slideDirection = 300
        withAnimation(.easeInOut(duration: 0.3)) {
            self.animateCard = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self else { return }
            self.animateCard = false
            self.currentIndex -= 1
        }
    }
}
