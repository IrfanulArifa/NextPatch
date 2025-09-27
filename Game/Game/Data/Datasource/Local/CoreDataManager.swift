//
//  CoreDataManager.swift
//  Game
//
//  Created by Irfanul Arifa on 27/09/25.
//

import Foundation
import CoreData

public class CoreDataManager {
    public static let shared = CoreDataManager()

    public let persistentContainer: NSPersistentContainer

    private init() {
        // ambil model dari bundle framework Game
        guard let modelURL = Bundle(for: CoreDataManager.self)
            .url(forResource: "NextPatchModel", withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("❌ Gagal load Core Data model dari framework")
        }

        persistentContainer = NSPersistentContainer(name: "NextPatchModel", managedObjectModel: model)

        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("❌ Error load persistent store: \(error)")
            }
        }
    }

    public var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("❌ Error save context: \(error)")
            }
        }
    }
}
