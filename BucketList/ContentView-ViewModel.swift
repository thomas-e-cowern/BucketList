//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/28/22.
//

import Foundation
import MapKit
import LocalAuthentication

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 26.7, longitude: -80.0), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
        
        @Published private (set) var locations: [Location]
        
        @Published var selectedPlace: Location?
        
        @Published var isUnlocked: Bool = false
        
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavedPlaces")
        
        init () {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save () {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data...")
            }
        }
        
        func addLocation () {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            
            // add to array of locations
            locations.append(newLocation)
            save()
        }
        
        func updateLocation(location: Location) {
            
            guard let selectedPlace = selectedPlace else {
                return
            }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authentiate () {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // Touch ID reason
                let reason = "Please authenticate yourself to unlock your saved places"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        // success condition
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        // error condtion
                        
                        
                    }
                    
                }
            } else {
                // No biometrics show alert or passcode
            }
        }
    }
}

