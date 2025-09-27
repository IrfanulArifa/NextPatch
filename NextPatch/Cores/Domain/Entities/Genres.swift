//
//  Genres.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

struct Genres: Codable {
    let count: Int
    let results: [GenresResponse]
}

struct GenresResponse: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let games: [GameData]

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
}

struct GameData: Codable {
    let id: Int
    let slug, name: String
    let added: Int
}

struct GenreEntity {
    let id: Int
    let name: String
    let slug: String
    let gamesCount: Int
    let imageBackground: String
}
