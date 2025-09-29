//
//  GameDetails.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

public struct GameDetails: Codable {
    public let id: Int
    public let name, nameOriginal, description: String
    public let released: String
    public let backgroundImage, backgroundImageAdditional: String
    public let website: String
    public let rating: Double
    public let ratingTop: Int
    public let added: Int
    public let alternativeNames: [String]
    public let metacriticURL: String
    public let parentsCount, additionsCount, gameSeriesCount, reviewsCount: Int
    public let saturatedColor, dominantColor: String
    public let developers, genres, tags, publishers: [Developer]
    public let descriptionRaw: String

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
    
    public init(
        id: Int,
        name: String,
        nameOriginal: String,
        description: String,
        released: String,
        backgroundImage: String,
        backgroundImageAdditional: String,
        website: String,
        rating: Double,
        ratingTop: Int,
        added: Int,
        alternativeNames: [String],
        metacriticURL: String,
        parentsCount: Int,
        additionsCount: Int,
        gameSeriesCount: Int,
        reviewsCount: Int,
        saturatedColor: String,
        dominantColor: String,
        developers: [Developer],
        genres: [Developer],
        tags: [Developer],
        publishers: [Developer],
        descriptionRaw: String
    ) {
        self.id = id
        self.name = name
        self.nameOriginal = nameOriginal
        self.description = description
        self.released = released
        self.backgroundImage = backgroundImage
        self.backgroundImageAdditional = backgroundImageAdditional
        self.website = website
        self.rating = rating
        self.ratingTop = ratingTop
        self.added = added
        self.alternativeNames = alternativeNames
        self.metacriticURL = metacriticURL
        self.parentsCount = parentsCount
        self.additionsCount = additionsCount
        self.gameSeriesCount = gameSeriesCount
        self.reviewsCount = reviewsCount
        self.saturatedColor = saturatedColor
        self.dominantColor = dominantColor
        self.developers = developers
        self.genres = genres
        self.tags = tags
        self.publishers = publishers
        self.descriptionRaw = descriptionRaw
    }
}

// MARK: - Developer
public struct Developer: Codable {
    public let id: Int
    public let name, slug: String
    public let gamesCount: Int
    public let imageBackground: String
    public let yearStart: Int?
    public let domain: String?
    public let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case yearStart = "year_start"
        case domain, language
    }
    
    public init(
        id: Int,
        name: String,
        slug: String,
        gamesCount: Int,
        imageBackground: String,
        yearStart: Int?,
        domain: String?,
        language: Language?
    ) {
        self.id = id
        self.name = name
        self.slug = slug
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
        self.yearStart = yearStart
        self.domain = domain
        self.language = language
    }
}

public struct MetacriticPlatform: Codable {
    public let metascore: Int
    public let url: String
    public let platform: MetacriticPlatformPlatform
    
    public init(metascore: Int, url: String, platform: MetacriticPlatformPlatform) {
        self.metascore = metascore
        self.url = url
        self.platform = platform
    }
}

public struct MetacriticPlatformPlatform: Codable {
    public let platform: Int
    public let name, slug: String
    
    public init(platform: Int, name: String, slug: String) {
        self.platform = platform
        self.name = name
        self.slug = slug
    }
}

public struct GameDetailsEntity {
    public let id: Int
    public let name: String
    public let released: String
    public let backgroundImage: String
    public let rating: Double
    public let ratingTop: Int
    public let description: String
    public let descriptionRaw: String
    public let developers: [DeveloperEntity]
    public let genres: [DeveloperEntity]
    public let tags: [DeveloperEntity]
    public let publishers: [DeveloperEntity]
    
    public init(
        id: Int,
        name: String,
        released: String,
        backgroundImage: String,
        rating: Double,
        ratingTop: Int,
        description: String,
        descriptionRaw: String,
        developers: [DeveloperEntity],
        genres: [DeveloperEntity],
        tags: [DeveloperEntity],
        publishers: [DeveloperEntity]
    ) {
        self.id = id
        self.name = name
        self.released = released
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingTop = ratingTop
        self.description = description
        self.descriptionRaw = descriptionRaw
        self.developers = developers
        self.genres = genres
        self.tags = tags
        self.publishers = publishers
    }
}

public struct DeveloperEntity {
    public let id: Int
    public let name: String
    public let imageBackground: String
    
    public init(id: Int, name: String, imageBackground: String) {
        self.id = id
        self.name = name
        self.imageBackground = imageBackground
    }
}
