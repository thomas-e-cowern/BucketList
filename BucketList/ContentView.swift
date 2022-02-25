//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/25/22.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 26.7, longitude: -80.0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Juno Beach", coordinates: CLLocationCoordinate2D(latitude: 26.8, longitude: -80.0)),
        Location(name: "Rosemary Square", coordinates: CLLocationCoordinate2D(latitude: 26.7084, longitude: -80.0)),
        Location(name: "Home", coordinates: CLLocationCoordinate2D(latitude: 26.726, longitude: -80.11))
    ]
    
    var loadingState = LoadingState.success
    
    var body: some View {
        
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else {
            FailedView()
        }
        
        Map(coordinateRegion: $mapRegion)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
