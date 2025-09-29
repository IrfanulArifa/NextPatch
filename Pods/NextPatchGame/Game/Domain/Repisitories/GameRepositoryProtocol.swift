//
//  GameRepositoryProtocol.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine

public protocol GameRepositoryProtocol {
    func fetchGames() -> AnyPublisher<Games, Error>
    func fetchGenres() -> AnyPublisher<Genres, Error>
    func fetchGameDetails(id: Int) -> AnyPublisher<GameDetails, Error>
    func getFavorites() -> [FavoriteGameData]
    func toggleFavorite(game: FavoriteGameData)
    func isFavorite(id: Int64) -> Bool
}
