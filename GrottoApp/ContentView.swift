import SwiftUI

struct ContentView: View {
    @State private var selectedLocation: Location?
    @State private var showSheet = false
    @StateObject private var locationManager = LocationManager() // Manage locations

    var body: some View {
        NavigationView {
            VStack {
                MapView(
                    locationManager: locationManager,
                    selectedLocation: $selectedLocation
                )
            }
            .onAppear {
                locationManager.fetchLocations() // Load locations on view appear
            }
            .onChange(of: selectedLocation) { oldValue, newValue in
                if newValue != nil {
                    showSheet = true
                }
            }
            .sheet(isPresented: $showSheet, onDismiss: { selectedLocation = nil }) {
                if let selectedLocation = selectedLocation {
                    ScrollView {
                        ItemView(location: selectedLocation)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

