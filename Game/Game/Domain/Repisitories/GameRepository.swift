//
//  GameRepository.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine

public class GameRepository: GameRepositoryProtocol {
    
    let gameDataSource: GameDataSource!
    
    public init(gameDataSource: GameDataSource!) {
        self.gameDataSource = gameDataSource
    }
    
    public func fetchGames() -> AnyPublisher<Games, Error> {
        gameDataSource.fetchGameFromServer()
    }

    public func fetchGenres() -> AnyPublisher<Genres, Error> {
        gameDataSource.fetchGenresFromServer()
    }
    
    public func fetchGameDetails(id: Int) -> AnyPublisher<GameDetails, Error> {
        gameDataSource.fetchGameDetailsFromServer(id: id)
    }
    
    public func getFavorites() -> [FavoriteGameData] {
        gameDataSource.getFavorites()
    }
    
    public func toggleFavorite(game: FavoriteGameData) {
        gameDataSource.toggleFavorite(game: game)
    }
    
    public func isFavorite(id: Int64) -> Bool {
        gameDataSource.isFavorite(id: id)
    }
}
