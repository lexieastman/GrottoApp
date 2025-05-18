import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

struct AboutView: View {
    @State private var showSafari = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                Text("About")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)
                
                Text("Welcome to the National Shrine Grotto of Our Lady of Lourdes! For more information: ")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                Link("Visit our website", destination: URL(string: "https://www.nsgrotto.org")!)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                
                
                
                Text("Tell us about you! Complete this voluntary survey to tell us where you are from and share your prayer intentions with us.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button("Open Form") {
                    showSafari = true
                }
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal, 20)
                .sheet(isPresented: $showSafari) {
                    SafariView(url: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScySd3NP3BKE4art6yVDMhHyftbYA8I-KapE645AsOVmLiw6A/viewform?usp=dialog")!)
                }
                
                VStack(alignment: .center, spacing: 20) {
                    Text("About the Shrine")
                        .font(.title2)
                        .bold()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("The National Shrine Grotto of Our Lady of Lourdes is a Catholic pilgrimage site located on the campus of Mount St. Mary’s University in Emmitsburg, Maryland. It traces its origins to 1805, when Father John Dubois, a French émigré and founder of Mount St. Mary’s, first set aside the mountainside as a place of prayer. Over time, the site developed into a cherished devotional destination. The original stone Grotto was constructed in 1858, inspired by the apparitions of the Blessed Virgin Mary to Saint Bernadette Soubirous in Lourdes, France in 1858. The Grotto was officially designated a National Shrine in 1965.\n\n The Grotto honors the Marian apparitions at Lourdes, where Mary revealed herself as the Immaculate Conception and called for prayer and penance. Millions travel to Lourdes in France each year seeking healing and spiritual renewal, and the Emmitsburg Grotto serves as a local reflection of that sacred encounter. The grounds include the Grotto cave itself, a large crucifix, outdoor Stations of the Cross, and multiple devotional areas dedicated to various saints. Pilgrims and visitors come year-round to pray, light candles, and find peace in the serene natural beauty of the site.")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    
                    
                    Image("OLLourdes")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipped()
                        
                }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    AboutView()
}
