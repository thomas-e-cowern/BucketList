//
//  ContentView.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/25/22.
//

import SwiftUI

struct ContentView: View {
    
    var loadingState = LoadingState.success
    
    var body: some View {
        
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else {
            FailedView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
