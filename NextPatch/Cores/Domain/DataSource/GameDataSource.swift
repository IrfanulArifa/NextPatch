//
//  GameDataSource.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 18/08/25.
//

import Combine
import UIKit
import Alamofire
import Game

class GameDataSource: GameDataSourceProtocol {
    
    func fetchGameFromServer() -> AnyPublisher<Games, any Error> {
        let url = "https://api.rawg.io/api/games"
        let parameters: [String: String] = [
            "key": "bf05f83573884db490b377b00c14cf21"
        ]
        
        return AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: Games.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func fetchGenresFromServer() -> AnyPublisher<Genres, any Error> {
        let url = "https://api.rawg.io/api/genres"
        let parameters: [String: String] = [
            "key": "bf05f83573884db490b377b00c14cf21"
        ]
        
        return AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: Genres.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func fetchGameDetailsFromServer(id: Int) -> AnyPublisher<GameDetails, any Error> {
        let url = "https://api.rawg.io/api/games/\(id)"
        let parameters: [String: String] = [
            "key": "bf05f83573884db490b377b00c14cf21"
        ]
        
        return AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: GameDetails.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
//    func fetchGameFromLocal() -> [FavoriteGameData] {
//        let games = FavoriteGameManager.shared.getAllFavorites()
//        var gameData: [FavoriteGameData] = []
//        
//        gameData = games.map { $0.toDomain() }
//        return gameData
//    }
//    
//    func toggleFavorite(data: FavoriteGameData) {
//        return FavoriteGameManager.shared.toggleFavorite(data: data)
//    }
//    
//    func isFavorite(data: FavoriteGameData) -> Bool {
//        return FavoriteGameManager.shared.isFavorite(id: data.id)
//    }
}
