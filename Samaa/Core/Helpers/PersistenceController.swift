//
//  PersistenceController.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import CoreData

final class PersistenceController {

    static let containerName = "Samaa"
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: Self.containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        container.viewContext
    }

    func save() {
        guard context.hasChanges else { return }
        try? context.save()
    }

    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        (try? context.fetch(request)) ?? []
    }

    func find<T: NSManagedObject>(request: NSFetchRequest<T>) -> T? {
        fetch(request: request).first
    }

    func create<T: NSManagedObject>(_ type: T.Type) -> T {
        T(context: context)
    }

    func delete(_ object: NSManagedObject) {
        context.delete(object)
    }
}
