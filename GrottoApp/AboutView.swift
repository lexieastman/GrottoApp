//
//  Untitled.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 12/2/24.
//

import SwiftUI

struct AboutView: View{
    var body: some View{
        VStack {
            Text("Welcome to the National Shrine Grotto of Our lady of Lourdes.")
            
        }

            Link("Visit our website", destination: URL(string: "https://www.nsgrotto.org")!)
                .padding()
                .background(Color.darkBlue)
                .foregroundColor(.cream)
                .cornerRadius(8)
            
            
        }
    }



#Preview {
    AboutView()
}
