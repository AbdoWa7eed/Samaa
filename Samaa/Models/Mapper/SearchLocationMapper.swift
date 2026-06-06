//
//  SearchLocationMapper.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

struct SearchLocationMapper {

  static func map(_ responses: [SearchLocationResponse]) -> [SearchLocation] {
    responses.compactMap(mapOne)
  }

  private static func mapOne(_ r: SearchLocationResponse) -> SearchLocation? {
    guard let id = r.id,
      let name = r.name,
      let country = r.country,
      let region = r.region,
      let lat = r.lat,
      let lon = r.lon
    else { return nil }

    return SearchLocation(
      id: id, name: name,
      country: country, region: region,
      coordinate:Coordinate(lat: lat, lon: lon)
    )
  }
}


extension SavedLocationEntity {

    func update(from location: SearchLocation) {
        self.id      = Int32(location.id)
        self.name    = location.name
        self.country = location.country
        self.region  = location.region
        self.lat     = location.coordinate.lat
        self.lon     = location.coordinate.lon
    }

    func toSearchLocation() -> SearchLocation {
        SearchLocation(
            id:         Int(id),
            name:       name ?? "",
            country:    country ?? "",
            region:     region ?? "",
            coordinate: Coordinate(lat: lat, lon: lon)
        )
    }
}
