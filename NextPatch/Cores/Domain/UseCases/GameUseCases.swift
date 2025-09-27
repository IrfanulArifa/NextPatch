//
//  GameUseCases.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine

struct GamesUseCase {
    let repository: GameRepository

    func getGamesData() -> AnyPublisher<Game, Error> {
        repository.fetchGames()
    }
    
    func getGenresData() -> AnyPublisher<Genres, Error> {
        repository.fetchGenres()
    }
    
    func getGameDetailData(id: Int) -> AnyPublisher<GameDetails, Error> {
        repository.fetchGameDetails(id: id)
    }
    
    func getFavoriteGames() -> [FavoriteGameData] {
        repository.getGameFromCoreData()
    }
    
    func toggleFavorite(data: FavoriteGameData) -> Void {
        repository.toggleFavorite(data: data)
    }
    
    func isFavorite(data: FavoriteGameData) -> Bool {
        repository.isFavorite(data: data)
    }
}
