//
//  Untitled.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 12/2/24.
//

import SwiftUI

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)  // Opens Safari inside your app
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

struct AboutView: View{
    @State private var showSafari = false
    var body: some View{
        
        
        VStack {
            Text("Welcome to the National Shrine Grotto of Our lady of Lourdes.")
            
        }
            Link("Visit our website", destination: URL(string: "https://www.nsgrotto.org")!)
                .padding()
                .background(Color.darkBlue)
                .foregroundColor(.cream)
                .cornerRadius(8)
        
        Text("Tell us about you! Complete this voluntary survey to tell us where you are from and share your prayer intentions with us.")
            .padding()
        
        
        Button("Open Form") {
                    showSafari = true
                }
        .padding()
        .background(Color.darkBlue)
        .foregroundColor(.cream)
        .cornerRadius(8)
                .sheet(isPresented: $showSafari) {
                    SafariView(url: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScySd3NP3BKE4art6yVDMhHyftbYA8I-KapE645AsOVmLiw6A/viewform?usp=dialog")!)
                }
            
            
        }
    }



#Preview {
    AboutView()
}
