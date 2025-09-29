//
//  FavoriteGameManager.swift
//  Game
//
//  Created by Irfanul Arifa on 27/09/25.
//

import Foundation
import CoreData

public class FavoriteGameManager {
    public static let shared = FavoriteGameManager()

    private let context: NSManagedObjectContext

    private init(context: NSManagedObjectContext = CoreDataManager.shared.context) {
        self.context = context
    }

    public func isFavorite(id: Int64) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        let count = (try? context.count(for: fetchRequest)) ?? 0
        return count > 0
    }

    public func getAllFavorites() -> [FavoriteGame] {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        return (try? context.fetch(fetchRequest)) ?? []
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("❌ Error saving context: \(error)")
        }
    }

    public func toggleFavorite(data: FavoriteGameData) {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", data.id)

        if let results = try? context.fetch(fetchRequest), let existingGame = results.first {
            context.delete(existingGame)
        } else {
            let game = FavoriteGame(context: context)
            game.id = data.id
            game.name = data.name
            game.rating = data.rating
            game.ratingTop = data.ratingTop
            game.released = data.released
            game.backgroundImage = data.backgroundImage
        }

        saveContext()
    }
}
