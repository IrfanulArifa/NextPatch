//
//  GameUseCases.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine
import Game

struct GamesUseCase {
    let repository: GameRepository

    func getGamesData() -> AnyPublisher<Games, Error> {
        repository.fetchGames()
    }
    
    func getGenresData() -> AnyPublisher<Genres, Error> {
        repository.fetchGenres()
    }
    
    func getGameDetailData(id: Int) -> AnyPublisher<GameDetails, Error> {
        repository.fetchGameDetails(id: id)
    }
}
