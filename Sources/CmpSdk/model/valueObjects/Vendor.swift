//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

struct Vendor: Codable {
    let id: String
    let iabId: Int
    let systemId: String
    let googleId: Int
    let name: String
    let purposes: [String]

    private enum CodingKeys: String, CodingKey {
        case id
        case iabId = "iabid"
        case systemId = "systemid"
        case googleId = "googleid"
        case name
        case purposes
    }
}
