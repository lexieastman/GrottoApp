//
//  NearbyView.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 3/4/25.
//

import SwiftUI

struct NearbyView: View{
    var body: some View{
        
        ScrollView{
            VStack {
                
                
                
                Text("MSMU Chapels")
                    .padding(.top, 5)
                    .padding(.bottom,5)
                    .font(.title)
                    .bold()
                    .frame(alignment: .leading)
                
                Text("""
            There are three chapels on the Mount St. Mary's University Campus. The Chapel of the Immacualte Conception (IC Chapel) is located at the top of the hill, close to the stairs leading up to and down fromt the Grotto. This chapel can be accessed by walking down the outdoor stone stairs, or by parking in lot 10 or lot 1. \n Kane chapel is in the bottom level of the Terrace residence hall, the building directly to the right if you are facing IC Chapel. \n The Mary Queen of Peace Chapel, also known as Pangborn chapel is located in the Pangborn dormitory. The entrance to the chapel is near the large "Mount St. Mary's Unvieristy" sign in front of Bradley Hall, the center building. There is a statue of our Blessed Mother right outside of the chapel. \n Please see the link below to access a map of the campus. 
            """)
                .padding(5)
                
                
                
                
                Link("Campus Map", destination: URL(string: "https://imgv2-1-f.scribdassets.com/img/document/586898810/original/d151fedeb8/1689118400?v=1")!)
                    .padding()
                    .background(Color.darkBlue)
                    .foregroundColor(.cream)
                    .cornerRadius(8)
                
                
                Text("Seton Shrine")
                    .padding(.top, 5)
                    .padding(.bottom,5)
                    .font(.title)
                    .bold()
                    .frame(alignment: .leading)
                
                Text("""
                The National Shrine of Saint Elizabeth Ann Seton is located just a few miles from the Grotto in Emmitsburg, Maryland. Mother Seton, the first American-born saint, founded a girls' school here in Emmitsburg. The Shrine offers rich historical insights into her life and work, as well as daily Mass, Adoration, Confession, guided tours, and a gift shop. See the Seton Shrine website for more details.
                """)
                .padding( 5)
                .frame(alignment: .leading)
                
                Link("Seton Shrine Websites", destination: URL(string: "https://setonshrine.org")!)
                    .padding()
                    .background(Color.darkBlue)
                    .foregroundColor(.cream)
                    .cornerRadius(8)
                
                
                Text("Accomodations")
                    .padding(.top, 5)
                    .padding(.bottom,5)
                    .font(.title)
                    .bold()
                    .frame(alignment: .leading)
                
                
                
                
            }
        }
    }}
#Preview{
    NearbyView()
}
