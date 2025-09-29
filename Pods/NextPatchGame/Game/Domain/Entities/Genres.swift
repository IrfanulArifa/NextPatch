//
//  Genres.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

public struct Genres: Codable {
    public let count: Int
    public let results: [GenresResponse]
    
    public init(count: Int, results: [GenresResponse]) {
        self.count = count
        self.results = results
    }
}

public struct GenresResponse: Codable {
    public let id: Int
    public let name, slug: String
    public let gamesCount: Int
    public let imageBackground: String
    public let games: [GameData]

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
    
    public init(id: Int, name: String, slug: String, gamesCount: Int, imageBackground: String, games: [GameData]) {
        self.id = id
        self.name = name
        self.slug = slug
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
        self.games = games
    }
}

public struct GameData: Codable {
    public let id: Int
    public let slug, name: String
    public let added: Int
    
    public init(id: Int, slug: String, name: String, added: Int) {
        self.id = id
        self.slug = slug
        self.name = name
        self.added = added
    }
}

public struct GenreEntity {
    public let id: Int
    public let name: String
    public let slug: String
    public let gamesCount: Int
    public let imageBackground: String
    
    public init(id: Int, name: String, slug: String, gamesCount: Int, imageBackground: String) {
        self.id = id
        self.name = name
        self.slug = slug
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
    }
}
