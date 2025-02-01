import SwiftUI
import MapKit
import CoreLocation

struct ItemView: View {
    
    let location: Location
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            // Title of the location
            Text(location.title)
                .padding(.top, 30)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 20)
            
            // Display the image if available
            if let imageUrl = location.imageURL, let url = URL(string: imageUrl!) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200) // Adjusted for larger image
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure:
                        Image("grotto pic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .opacity(0.5)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image("grotto pic") // Default if no URL
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .opacity(0.5)
            }
            
            // Body text of the location
            Text(location.body)
                .font(.body)
                .padding(.leading, 20)
                .padding(.top, 5)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Spacer() // Pushes content up
            
            // Dismiss button to go back
            Button("Dismiss") {
                dismiss()
            }
            .padding(.bottom, 20)
        }
        .padding() // Adds padding around the entire VStack
    }
}





