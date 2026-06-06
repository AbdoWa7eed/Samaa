//
//  SavedLocationsServiceProtocol.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation


protocol SavedLocationsServiceProtocol {
    func save(_ location: SearchLocation)
    func fetchAll() -> [SearchLocation]
    func delete(withId id: Int)
    func isSaved(id: Int) -> Bool
}
