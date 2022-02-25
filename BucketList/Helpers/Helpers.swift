//
//  Helpers.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/25/22.
//

import Foundation
import SwiftUI

func getDocumentsDirectory () -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}

func saveDocumentToDirectory (str: String) {
    let url = getDocumentsDirectory().appendingPathComponent("message.txt")
    
    do {
        try  str.write(to: url, atomically: true, encoding: .utf8)
        let input = try String(contentsOf: url)
        print("Input for saveDocumentToDirectory: \(input)")
    } catch {
        print(error.localizedDescription)
    }
}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success...")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed...")
    }
}
