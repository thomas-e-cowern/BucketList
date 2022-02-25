//
//  Location.swift
//  BucketList
//
//  Created by Thomas Cowern New on 2/25/22.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
