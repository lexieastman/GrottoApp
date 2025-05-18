import SwiftUI

struct NearbyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("MSMU Chapels")
                    .font(.title)
                    .bold()
                    .padding(.top,10)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("""
                There are three chapels on the Mount St. Mary's University Campus. 
                
                - **Chapel of the Immaculate Conception (IC Chapel)** is located at the top of the hill, close to the stairs leading up to and down from the Grotto. It can be accessed by walking down the outdoor stone stairs or by parking in Lot 10 or Lot 1. 
                - **Kane Chapel** is in the bottom level of the Terrace residence hall, the building directly to the right if you are facing IC Chapel. 
                - **Mary Queen of Peace Chapel (Pangborn Chapel)** is located in the Pangborn dormitory. The entrance is near the large "Mount St. Mary's University" sign in front of Bradley Hall, the center building. A statue of Our Blessed Mother stands right outside the chapel.
                
                Please see the link below to access a map of the campus.
                """)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                Link("Campus Map", destination: URL(string: "https://imgv2-1-f.scribdassets.com/img/document/586898810/original/d151fedeb8/1689118400?v=1")!)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Text("Seton Shrine")
                    .font(.title)
                    .bold()
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("""
                The National Shrine of Saint Elizabeth Ann Seton is located just a few miles from the Grotto in Emmitsburg, Maryland. Mother Seton, the first American-born saint, founded a girls' school here in Emmitsburg. 
                
                The Shrine offers rich historical insights into her life and work, as well as daily Mass, Adoration, Confession, guided tours, and a gift shop. See the Seton Shrine website for more details.
                """)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                Link("Seton Shrine Website", destination: URL(string: "https://setonshrine.org")!)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Text("Accommodations")
                    .font(.title)
                    .bold()
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("""
                Visitors to the National Shrine Grotto of Our Lady of Lourdes will find several convenient lodging options in the surrounding area. The Sleep Inn & Suites in Emmitsburg is the closest hotel, located just a few minutes from the Grotto, offering comfortable rooms and modern amenities. Just 15 minutes north, Gettysburg, Pennsylvania provides a wider range of accommodations including national hotel chains, historic inns, and charming bed and breakfasts such as the Brickhouse Inn and Federal Pointe Inn. To the south, Frederick, Maryland, located about 25 minutes away, offers an even broader selection of hotels, boutique inns, and dining experiences, ideal for those seeking more urban conveniences.
                """)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(.horizontal)
                
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    NearbyView()
}
