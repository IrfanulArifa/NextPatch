//
//  GameDataSourceProtocol.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 18/08/25.
//

import Combine

protocol GameDataSourceProtocol {
    func fetchGameFromServer() -> AnyPublisher<Game, Error>
    func fetchGenresFromServer() -> AnyPublisher<Genres, Error>
    func fetchGameDetailsFromServer(id: Int) -> AnyPublisher<GameDetails, Error>
    func fetchGameFromLocal() -> [FavoriteGameData]
    func toggleFavorite(data: FavoriteGameData) -> Void
    func isFavorite(data: FavoriteGameData) -> Bool
}
