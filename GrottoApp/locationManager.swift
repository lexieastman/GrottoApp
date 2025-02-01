import CoreLocation
import Combine
import SQLite3

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var locations: [Location] = []  // Stores fetched locations
    
    private var databaseManager = DatabaseManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        DispatchQueue.main.async {
            self.locationManager.requestWhenInUseAuthorization()
        }
        fetchLocations() // Fetch locations on init
    }
    
    /// Fetch locations from the database and update `locations` property
    func fetchLocations() {
        locations = databaseManager.fetchLocations()
        print("locations,",locations)
    }
    
    // CLLocationManagerDelegate - Updates user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
}
