import Foundation
import SQLite3
import CoreLocation

class DatabaseManager {
    var db: OpaquePointer?

    init() {
        // Get the path to the database from the app bundle
        if let databasePath = Bundle.main.path(forResource: "grottoLandmarks", ofType: "db") {
            // Open the SQLite database
            if sqlite3_open(databasePath, &db) != SQLITE_OK {
                print("Error opening database.")
            } else {
                print("Database opened successfully at path: \(databasePath)")
            }
        } else {
            print("Database file not found in the app bundle.")
        }
    }

    deinit {
        // Close the database when done
        sqlite3_close(db)
    }

    // Function to fetch all locations
    func fetchLocations() -> [Location] {
        var locations = [Location]()

        let queryString = "SELECT id, title, latitude, longitude, body, imageURL FROM landmark"
        var statement: OpaquePointer?

        // Prepare the SQL query
        if sqlite3_prepare_v2(db, queryString, -1, &statement, nil) != SQLITE_OK {
            print("Error preparing statement.")
            return locations
        }

        // Execute the query and fetch rows
        while sqlite3_step(statement) == SQLITE_ROW {
            let id = sqlite3_column_int(statement, 0)
            let title = String(cString: sqlite3_column_text(statement, 1))

            // Extract latitude and longitude (columns 2 and 3)
            let latitude = sqlite3_column_double(statement, 2)
            let longitude = sqlite3_column_double(statement, 3)

            // Create CLLocationCoordinate2D
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            let body = String(cString: sqlite3_column_text(statement, 4))
            let imageURL = String(cString: sqlite3_column_text(statement, 5))

            // Create a Location object and append to the list
            let location = Location(  coordinate: coordinates, title: title, body:body, imageURL: imageURL)
            locations.append(location)
        }

        // Finalize the statement
        sqlite3_finalize(statement)

        return locations
    }
}
