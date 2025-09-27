//
//  GameRepository.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine
import Game

class GameRepository: GameRepositoryProtocol {
    
    let gameDataSource: GameDataSource!
    
    init(gameDataSource: GameDataSource!) {
        self.gameDataSource = gameDataSource
    }
    
    func fetchGames() -> AnyPublisher<Games, Error> {
        gameDataSource.fetchGameFromServer()
    }

    func fetchGenres() -> AnyPublisher<Genres, Error> {
        gameDataSource.fetchGenresFromServer()
    }
    
    func fetchGameDetails(id: Int) -> AnyPublisher<GameDetails, Error> {
        gameDataSource.fetchGameDetailsFromServer(id: id)
    }
}
