//
//  DonateView.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 12/2/24.
//

import SwiftUI

struct DonateView: View{
    var body: some View{
        VStack {
            
            Text("Donate")
                .padding(.top, 30)
                .padding(.bottom,5)
                .font(.largeTitle)
                .bold()
                
            
            Text("We sincerely thank you for you generousity. \n Your support, spiritually, financially, and otherwise, is what enables us to keep going!")
                .padding(.bottom,5)
            
            Link("Support the Grotto", destination: URL(string: "https://www.nsgrotto.org/support.html")!)
                .padding()
                .background(Color.darkBlue)
                .foregroundColor(.cream)
                .cornerRadius(8)

            Text("   Preserve the memory of your special occasion or loved ones on this beautiful mountain shrine devoted to Our Mother, Mary.\n  Your generous donation will go to our annual fund to maintain these holy grounds. These memorials are the property of Mount St. Mary's University and will be maintained with annual funds for the life of the item. ")
                .padding(.bottom, 5)

            
            Link("Preserve a Memory", destination: URL(string: "https://www.nsgrotto.org/preserve-a-memory.html")!)
                .padding()
                .background(Color.darkBlue)
                .foregroundColor(.cream)
                .cornerRadius(8)
                .padding(.bottom, 20)
            
            Image("donate")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 250) // Width matches parent, height is cropped
                .offset(y: -45)
                .clipped()
                
            


            
        
            
        }
        .padding(.horizontal, 20)
        
        
        
    
    }
}

#Preview {
    DonateView()
}

