//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

struct Purpose: Codable {
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
