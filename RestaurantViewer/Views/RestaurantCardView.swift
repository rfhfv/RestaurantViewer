import SwiftUI

struct RestaurantCardView: View {
    var restaurant: Restaurant
    let index: Int
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: restaurant.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 150)
                    .clipped()
            } placeholder: {
                Color.gray
            }
            .frame(width: 250, height: 150)
            .scaledToFill()
            
            Text("\(index + 1). \(restaurant.name)")
                .font(.headline)
                .padding(.top, 10)
            
            Text("Rating: \(restaurant.rating, specifier: "%.1f")")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
    }
}
