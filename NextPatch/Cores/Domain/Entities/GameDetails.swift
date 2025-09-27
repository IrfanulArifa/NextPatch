//
//  GameDetails.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

struct GameDetails: Codable {
    let id: Int
    let name, nameOriginal, description: String
    let released: String
    let backgroundImage, backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let added: Int
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount, reviewsCount: Int
    let saturatedColor, dominantColor: String
    let developers, genres, tags, publishers: [Developer]
    let descriptionRaw: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameOriginal = "name_original"
        case description
        case released
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case added
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case developers, genres, tags, publishers
        case descriptionRaw = "description_raw"
    }
}

// MARK: - Developer
struct Developer: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let yearStart: Int?
    let domain: String?
    let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case yearStart = "year_start"
        case domain, language
    }
}

struct MetacriticPlatform: Codable {
    let metascore: Int
    let url: String
    let platform: MetacriticPlatformPlatform
}

struct MetacriticPlatformPlatform: Codable {
    let platform: Int
    let name, slug: String
}

struct GameDetailsEntity {
    let id: Int
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let description: String
    let descriptionRaw: String
    let developers: [DeveloperEntity]
    let genres: [DeveloperEntity]
    let tags: [DeveloperEntity]
    let publishers: [DeveloperEntity]
}

struct DeveloperEntity {
    let id: Int
    let name: String
    let imageBackground: String
}
