//
//  MainNavigationView.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 12/2/24.
//


import SwiftUI

struct MainNavigationView: View {
    @State private var selectedLocation: Location?  // Track selected location
    @State private var showSheet = false
    var body: some View {
        
        
        NavigationView {
            VStack{
                List (){
                    Image("logo@2x")
                        .resizable()
                        .scaledToFit()
                    
                    Image("grotto pic")
                        .resizable() // Makes the image resizable
                        .scaledToFit() // Keeps the aspect ratio of the image
                        .frame(width: 450) // Adjust the size to fit your layout
                    NavigationLink(destination: AboutView()) {
                        Text("About the Grotto")
                    }
                    NavigationLink(destination: MapViewWrapper(selectedLocation: $selectedLocation)) {
                        Text("View Map")
                    }
                    NavigationLink(destination: DonateView()){
                        Text("Support/ Donate")
                    }
                    // Add more NavigationLinks as needed
                }
            }
        }}

}

struct MapViewWrapper: View {
    @StateObject private var locationManager = LocationManager() // Initialize LocationManager
    @Binding var selectedLocation: Location? // Accept selectedLocation as a Binding

    var body: some View {
        MapView(locationManager: locationManager, locations: Locations, selectedLocation: $selectedLocation)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MainNavigationView()
}
