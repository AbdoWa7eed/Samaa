//
//  NetworkError.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

enum NetworkError: LocalizedError {

    case noInternet
    case invalidResponse
    case decodingError
    case serverError(String)

    var errorDescription: String? {
        switch self {
        case .noInternet:       return "No internet connection."
        case .invalidResponse:  return "Invalid server response."
        case .decodingError:    return "Failed to parse weather data."
        case .serverError(let message): return message
        }
    }
}
