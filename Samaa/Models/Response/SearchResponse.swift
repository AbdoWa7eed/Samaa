//
//  SearchResponse.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

struct SearchLocationResponse: Decodable {
    let id: Int?
    let name: String?
    let country: String?
    let region: String?
    let lat: Double?
    let lon: Double?
}
