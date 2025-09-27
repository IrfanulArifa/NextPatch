//
//  GameRepository.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine

class GameRepository: GameRepositoryProtocol {
    
    let gameDataSource: GameDataSource!
    
    init(gameDataSource: GameDataSource!) {
        self.gameDataSource = gameDataSource
    }
    
    func fetchGames() -> AnyPublisher<Game, Error> {
        gameDataSource.fetchGameFromServer()
    }

    func fetchGenres() -> AnyPublisher<Genres, Error> {
        gameDataSource.fetchGenresFromServer()
    }
    
    func fetchGameDetails(id: Int) -> AnyPublisher<GameDetails, Error> {
        gameDataSource.fetchGameDetailsFromServer(id: id)
    }
    
    func getGameFromCoreData() -> [FavoriteGameData] {
        gameDataSource.fetchGameFromLocal()
    }
    
    func toggleFavorite(data: FavoriteGameData) {
        gameDataSource.toggleFavorite(data: data)
    }
    
    func isFavorite(data: FavoriteGameData) -> Bool {
        gameDataSource.isFavorite(data: data)
    }
}
