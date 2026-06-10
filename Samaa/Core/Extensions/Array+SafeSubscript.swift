//
//  Array+SafeSubscript.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
