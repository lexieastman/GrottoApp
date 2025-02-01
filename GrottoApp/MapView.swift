import SwiftUI
import MapKit
import CoreLocation

@MainActor
struct MapView: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager
    @Binding var selectedLocation: Location? // Binding to show details when selected
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        var hasCenteredOnUser = false  // Prevents constant recentering

        init(parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation {
                if let location = parent.locationManager.locations.first(where: {
                    $0.coordinate.latitude == annotation.coordinate.latitude &&
                    $0.coordinate.longitude == annotation.coordinate.longitude
                }) {
                    parent.selectedLocation = location
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.pointOfInterestFilter = .excludingAll
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.isScrollEnabled = true  // Allow user to move the map
        mapView.isZoomEnabled = true
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Center on user location only if it hasn't been centered yet
        if let userLocation = locationManager.userLocation{
            
            if  !context.coordinator.hasCenteredOnUser {
                let region = MKCoordinateRegion(
                    center: userLocation.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                )
                uiView.setRegion(region, animated: true)
                context.coordinator.hasCenteredOnUser = true  // Mark as centered
            }}
        else {
            // If user location is not available, set a default region
            let defaultCoordinate = CLLocationCoordinate2D(latitude: 39.6825, longitude: -77.3578) // Example: Emmitsburg, MD
            let defaultRegion = MKCoordinateRegion(
                center: defaultCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
            uiView.setRegion(defaultRegion, animated: true)
        }
        
        uiView.isScrollEnabled = true
        uiView.isZoomEnabled = true

        // Remove previous annotations and add the new ones
        uiView.removeAnnotations(uiView.annotations)
        for location in locationManager.locations {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = location.title
            annotation.subtitle = location.body
            uiView.addAnnotation(annotation)
        }
    }
}
