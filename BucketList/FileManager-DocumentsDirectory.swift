//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/28/22.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
