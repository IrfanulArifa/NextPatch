//
//  GameDataSourceProtocol.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 18/08/25.
//

import Combine

public protocol GameDataSourceProtocol {
    func fetchGameFromServer() -> AnyPublisher<Games, Error>
    func fetchGenresFromServer() -> AnyPublisher<Genres, Error>
    func fetchGameDetailsFromServer(id: Int) -> AnyPublisher<GameDetails, Error>
    func getFavorites() -> [FavoriteGameData]
    func toggleFavorite(game: FavoriteGameData)
    func isFavorite(id: Int64) -> Bool
}
