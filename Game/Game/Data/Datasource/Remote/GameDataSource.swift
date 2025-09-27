//
//  GameDataSource.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 18/08/25.
//

import Combine
import Foundation

public class GameDataSource: GameDataSourceProtocol {
    
    private let baseURL = "https://api.rawg.io/api"
    private let apiKey = "bf05f83573884db490b377b00c14cf21"
    
    private let favoriteManager: FavoriteGameManager
        
    public init(favoriteManager: FavoriteGameManager = FavoriteGameManager.shared) {
        self.favoriteManager = favoriteManager
    }
    
    private func makeRequest<T: Decodable>(endpoint: String, type: T.Type) -> AnyPublisher<T, Error> {
        guard var components = URLComponents(string: "\(baseURL)/\(endpoint)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        guard let url = components.url else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        print("Requesting: \(url.absoluteString)")
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                // Debug raw JSON
                if let raw = String(data: output.data, encoding: .utf8) {
                    print("RAW:", raw.prefix(200))
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    public func fetchGameFromServer() -> AnyPublisher<Games, Error> {
        return makeRequest(endpoint: "games", type: Games.self)
    }
    
    public func fetchGenresFromServer() -> AnyPublisher<Genres, Error> {
        return makeRequest(endpoint: "genres", type: Genres.self)
    }
    
    public func fetchGameDetailsFromServer(id: Int) -> AnyPublisher<GameDetails, Error> {
        return makeRequest(endpoint: "games/\(id)", type: GameDetails.self)
    }
    
    public func getFavorites() -> [FavoriteGameData] {
        favoriteManager.getAllFavorites().map {
            FavoriteGameData(
                id: $0.id,
                name: $0.name ?? "",
                rating: $0.rating,
                ratingTop: $0.ratingTop,
                released: $0.released ?? "",
                backgroundImage: $0.backgroundImage ?? ""
            )
        }
    }
    
    public func toggleFavorite(game: FavoriteGameData) {
        favoriteManager.toggleFavorite(data: game)
    }
    
    public func isFavorite(id: Int64) -> Bool {
        favoriteManager.isFavorite(id: id)
    }
}
