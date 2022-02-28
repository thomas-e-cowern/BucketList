//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/28/22.
//

import Foundation
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 26.7, longitude: -80.0), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
        
        @Published private (set) var locations = [Location]()
        
        @Published var selectedPlace: Location?
        
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavedPlaces")
        
        init () {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation () {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            
            // add to array of locations
            locations.append(newLocation)
        }
        
        func updateLocation(location: Location) {
            
            guard let selectedPlace = selectedPlace else {
                return
            }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
    }
}

