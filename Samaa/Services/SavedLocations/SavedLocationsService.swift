//
//  SavedLocationsService.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//
import Foundation
import CoreData
import Combine

final class SavedLocationsService: SavedLocationsServiceProtocol {

    private let persistenceController: PersistenceController
    private let locationsSubject: CurrentValueSubject<[SearchLocation], Never>

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
        
        let request: NSFetchRequest<SavedLocationEntity> = SavedLocationEntity.fetchRequest()
        let initialLocations = persistenceController.fetch(request: request).map { $0.toSearchLocation() }
        self.locationsSubject = CurrentValueSubject(initialLocations)
    }

    func save(_ location: SearchLocation) {
        guard !isSaved(id: location.id) else { return }
        let entity = persistenceController.create(SavedLocationEntity.self)
        entity.update(from: location)
        persistenceController.save()
        refresh()
    }

    func fetchAll() -> AnyPublisher<[SearchLocation], Never> {
        locationsSubject.eraseToAnyPublisher()
    }

    func delete(withId id: Int) {
        let request: NSFetchRequest<SavedLocationEntity> = SavedLocationEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        guard let entity = persistenceController.find(request: request) else { return }
        persistenceController.delete(entity)
        persistenceController.save()
        refresh()
    }

    func isSaved(id: Int) -> Bool {
        let request: NSFetchRequest<SavedLocationEntity> = SavedLocationEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        return persistenceController.find(request: request) != nil
    }

    private func refresh() {
        let request: NSFetchRequest<SavedLocationEntity> = SavedLocationEntity.fetchRequest()
        let updatedLocations = persistenceController.fetch(request: request).map { $0.toSearchLocation() }
        locationsSubject.send(updatedLocations)
    }
}
