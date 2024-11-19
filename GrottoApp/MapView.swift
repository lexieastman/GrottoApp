import SwiftUI
import MapKit
import CoreLocation

@MainActor @preconcurrency
struct UserLocation {
    var location: CLLocation?
    var heading: CLHeading?
}

// Tracking and displaying user location
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: UserLocation = UserLocation()
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation.location = latestLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        DispatchQueue.main.async {
            self.userLocation.heading = newHeading
        }
    }
}

struct MapView: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    var locations: [Location]  // List of locations
    @Binding var selectedLocation: Location?  // Selected location binding
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.pointOfInterestFilter = .excludingAll
        mapView.delegate = context.coordinator  // Set delegate
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 39.681458, longitude: -77.356176)
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
        
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        
        // Add annotations for each location
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = location.title
            annotation.subtitle = location.body
            uiView.addAnnotation(annotation)
        }
        
        // Add user location annotation if available
        if let userLocation = locationManager.userLocation.location {
            let userAnnotation = MKPointAnnotation()
            userAnnotation.coordinate = userLocation.coordinate
            userAnnotation.title = "You are here"
            uiView.addAnnotation(userAnnotation)
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        // Detect when an annotation is tapped
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation {
                if let location = parent.locations.first(where: {
                    $0.coordinate.latitude == annotation.coordinate.latitude &&
                    $0.coordinate.longitude == annotation.coordinate.longitude
                }) {
                    parent.selectedLocation = location // Update selected location
                }
            }
        }
    }
}
#Preview {
    let locationManager = LocationManager() // Initialize the LocationManager
    
    
    return MapView(
        locationManager: locationManager,
        locations: Locations,
        selectedLocation: .constant(nil) // Use .constant for preview
    )
}
let Locations = [
    Location(coordinate: CLLocationCoordinate2D(latitude: 39.681458, longitude: -77.356176), title: "Center", body: "Info", imageName: "grotto pic"),
    Location(coordinate: CLLocationCoordinate2D(latitude: 39.684, longitude: -77.358), title: "Another Point", body: "Info", imageName: "grotto pic")
]
