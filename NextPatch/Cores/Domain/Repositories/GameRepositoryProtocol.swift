//
//  GameRepositoryProtocol.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import Combine
import Game

protocol GameRepositoryProtocol {
    func fetchGames() -> AnyPublisher<Games, Error>
    func fetchGenres() -> AnyPublisher<Genres, Error>
    func fetchGameDetails(id: Int) -> AnyPublisher<GameDetails, Error>
}
