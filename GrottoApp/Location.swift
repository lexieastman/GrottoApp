//
//  Untitled.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 1/29/25.
//

import SwiftUI
import MapKit
import CoreLocation
struct Location: Identifiable, Hashable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let body: String
    let imageURL: String??
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Conforming to Equatable (needed for Hashable)
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
}
