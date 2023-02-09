//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

struct Metadata: Codable {
    let name: String
    let value: Int
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case value
        case type
    }
}
