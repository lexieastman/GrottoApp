import SwiftUI

struct DonateView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                Text("Donate")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)

                
                Text("We sincerely thank you for your generosity. \nYour support, spiritually, financially, and otherwise, is what enables us to keep going!")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(4)
                    .shadow(radius: 2)
                    .padding(.horizontal, 30)
                
                
                Link("Support the Grotto", destination: URL(string: "https://www.nsgrotto.org/support.html")!)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                
                Text("Preserve the memory of your special occasion or loved ones at this beautiful mountain shrine devoted to Our Mother, Mary.\nYour generous donation will contribute to our annual fund to maintain these holy grounds. These memorials are the property of Mount St. Mary's University and will be preserved through annual funds for the life of the item.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(4)
                    .shadow(radius: 2)
                    .padding(.horizontal, 30)
                
                
                
                Link("Preserve a Memory", destination: URL(string: "https://www.nsgrotto.org/preserve-a-memory.html")!)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                
                Image("donate")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .clipped()
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    DonateView()
}


