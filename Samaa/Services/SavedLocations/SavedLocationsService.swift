//
//  SavedLocationsService.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation
import CoreData

final class SavedLocationsService: SavedLocationsServiceProtocol {

    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func save(_ location: SearchLocation) {
        guard !isSaved(id: location.id) else { return }
        let entity = persistenceController.create(SavedLocationEntity.self)
        entity.update(from: location)
        persistenceController.save()
    }

    func fetchAll() -> [SearchLocation] {
        let request: NSFetchRequest<SavedLocationEntity> =
            SavedLocationEntity.fetchRequest()
        return persistenceController
            .fetch(request: request)
            .map { $0.toSearchLocation() }
    }

    func delete(withId id: Int) {
        let request: NSFetchRequest<SavedLocationEntity> =
            SavedLocationEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        guard let entity = persistenceController.find(request: request)
        else { return }
        persistenceController.delete(entity)
        persistenceController.save()
    }

    func isSaved(id: Int) -> Bool {
        let request: NSFetchRequest<SavedLocationEntity> =
            SavedLocationEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        return persistenceController.find(request: request) != nil
    }
}
