//
//  Location.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/25/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id  && lhs.name == rhs.name && lhs.description == rhs.description && lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    static let example = Location(id: UUID(), name: "Home", description: "Where I live", latitude: 26.72579, longitude: -80.11560)
}
