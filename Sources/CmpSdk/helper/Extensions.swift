//
//  File.swift
//  
//
//  Created by Skander Ben Abdelmalak on 08.02.23.
//

import Foundation

extension Date {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    var encoded: String {
        return Date.dateFormatter.string(from: self)
    }

    static func fromEncodedString(_ encodedString: String) -> Date? {
        return Date.dateFormatter.date(from: encodedString)
    }
}
