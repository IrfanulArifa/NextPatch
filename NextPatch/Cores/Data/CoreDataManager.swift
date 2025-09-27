//
//  CoreDataManager.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

import CoreData
import UIKit
import Game

//class FavoriteGameManager {
//    static let shared = FavoriteGameManager()
//    private let context = (UIApplication.shared.delegate as! AppDelegate)
//        .persistentContainer.viewContext
//
//    func addFavorite(data: FavoriteGameData) {
//        let game = FavoriteGame(context: context)
//        game.id = data.id
//        game.name = data.name
//        game.rating = data.rating
//        game.ratingTop = data.ratingTop
//        game.released = data.released
//        game.backgroundImage = data.backgroundImage
//        saveContext()
//    }
//
//    func removeFavorite(by id: Int64) {
//        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
//        if let results = try? context.fetch(fetchRequest) {
//            results.forEach { context.delete($0) }
//            saveContext()
//        }
//    }
//
//    func isFavorite(id: Int64) -> Bool {
//        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
//        let count = (try? context.count(for: fetchRequest)) ?? 0
//        return count > 0
//    }
//
//    func getAllFavorites() -> [FavoriteGame] {
//        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
//        return (try? context.fetch(fetchRequest)) ?? []
//    }
//
//    private func saveContext() {
//        do {
//            try context.save()
//        } catch {
//            print("Error saving context: \(error)")
//        }
//    }
//    
//    func toggleFavorite(data: FavoriteGameData) {
//        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %d", data.id)
//
//        if let results = try? context.fetch(fetchRequest), let existingGame = results.first {
//            context.delete(existingGame)
//        } else {
//            let game = FavoriteGame(context: context)
//            game.id = data.id
//            game.name = data.name
//            game.rating = data.rating
//            game.ratingTop = data.ratingTop
//            game.released = data.released
//            game.backgroundImage = data.backgroundImage
//        }
//
//        saveContext()
//    }
//}
