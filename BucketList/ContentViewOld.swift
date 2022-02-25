//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/25/22.
//

import SwiftUI
import MapKit
import LocalAuthentication

//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinates: CLLocationCoordinate2D
//}

struct ContentViewOld: View {
    
    @State private var isUnlocked: Bool = false
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 26.7, longitude: -80.0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
//    let locations = [
//        Location(name: "Juno Beach", coordinates: CLLocationCoordinate2D(latitude: 26.8798, longitude: -80.0534)),
//        Location(name: "Rosemary Square", coordinates: CLLocationCoordinate2D(latitude: 26.7084, longitude: -80.0570)),
//        Location(name: "Home", coordinates: CLLocationCoordinate2D(latitude: 26.72579, longitude: -80.11560))
//    ]
    
    var loadingState = LoadingState.success
    
    var body: some View {
//        VStack {
//            if loadingState == .loading {
//                LoadingView()
//            } else if loadingState == .success {
//                SuccessView()
//            } else {
//                FailedView()
//            }
//            
//            if isUnlocked {
//                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//                    MapAnnotation(coordinate: location.coordinates) {
//                        Circle()
//                            .stroke(.red, lineWidth: 3)
//                            .frame(width: 20, height: 20)
//                        Text(location.name)
//                            .foregroundColor(.pink)
//                    }
//                }
//            } else {
//                Image(systemName: "hand.raised")
//            }
//        }
//        .onAppear(perform: authenticate)
    }
    
    func authenticate () {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationErrpr in
                if success {
                    // authentication successful
                    isUnlocked = true
                } else {
                    // not good
                }
                
            }
        } // MARK:  End of canEvaluatePolicy If
        else {
            // phone not capable of biometrics or not enrolled
        }
    }
    
}

struct ContentViewOld_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
