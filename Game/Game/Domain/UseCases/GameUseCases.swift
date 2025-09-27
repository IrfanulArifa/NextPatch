//
//  GameUseCases.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine

public struct GamesUseCase {
    let repository: GameRepository
    
    public init(repository: GameRepository) {
        self.repository = repository
    }

    public func getGamesData() -> AnyPublisher<Games, Error> {
        repository.fetchGames()
    }
    
    public func getGenresData() -> AnyPublisher<Genres, Error> {
        repository.fetchGenres()
    }
    
    public func getGameDetailData(id: Int) -> AnyPublisher<GameDetails, Error> {
        repository.fetchGameDetails(id: id)
    }
}
