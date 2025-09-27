//
//  GameRepositoryProtocol.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine

protocol GameRepositoryProtocol {
    func fetchGames() -> AnyPublisher<Game, Error>
    func fetchGenres() -> AnyPublisher<Genres, Error>
    func fetchGameDetails(id: Int) -> AnyPublisher<GameDetails, Error>
    func getGameFromCoreData() -> [FavoriteGameData]
    func toggleFavorite(data: FavoriteGameData) -> Void
    func isFavorite(data: FavoriteGameData) -> Bool
}
