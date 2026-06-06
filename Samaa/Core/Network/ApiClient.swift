//
//  ApiClient.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

protocol ApiClientProtocol {
    func request<T: Decodable>(
        endpoint: String,
        parameters: [String: String]
    ) async throws -> T
}


final class ApiClient: ApiClientProtocol {

    func request<T: Decodable>(
        endpoint: String,
        parameters: [String: String] = [:]
    ) async throws -> T {

        let url = try buildURL(
            endpoint: endpoint,
            parameters: parameters
        )

        let (data, response) = try await performRequest(url)

        try validateResponse(
            response,
            data: data
        )

        return try decode(data)
    }

    private func buildURL(
        endpoint: String,
        parameters: [String: String]
    ) throws -> URL {

        var components = URLComponents(
            string: "\(ApiConstants.baseUrl)/\(endpoint)"
        )

        var queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        queryItems.append(
            URLQueryItem(
                name: ApiConstants.Params.key,
                value: ApiConstants.apiKey
            )
        )

        components?.queryItems = queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidResponse
        }

        return url
    }

    private func performRequest(
        _ url: URL
    ) async throws -> (Data, URLResponse) {

        do {
            return try await URLSession.shared.data(from: url)
        } catch let error as URLError
            where error.code == .notConnectedToInternet ||
                  error.code == .networkConnectionLost {
            throw NetworkError.noInternet
        }
    }

    private func validateResponse(
        _ response: URLResponse,
        data: Data
    ) throws {

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {

            if let message = try? JSONDecoder()
                .decode([String: String].self, from: data)["message"] {
                throw NetworkError.serverError(message)
            }

            throw NetworkError.invalidResponse
        }
    }

    private func decode<T: Decodable>(
        _ data: Data
    ) throws -> T {

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
