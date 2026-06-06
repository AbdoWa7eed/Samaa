//
//  Coordinate.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

import Foundation

struct Coordinate {
    let lat: Double
    let lon: Double

    var queryString: String {
        "\(lat),\(lon)"
    }
}
