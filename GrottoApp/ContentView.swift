//
//  ContentView.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 11/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLocation: Location?  // Track selected location
    @State private var showSheet = false
    @StateObject private var locationManager = LocationManager() // Create LocationManager instance

    var body: some View {
        MapView(locationManager: locationManager, locations:Locations,selectedLocation: $selectedLocation) // Pass the locationManager instance
            .edgesIgnoringSafeArea(.all)
    }
}
    

#Preview{
    ContentView()
}

