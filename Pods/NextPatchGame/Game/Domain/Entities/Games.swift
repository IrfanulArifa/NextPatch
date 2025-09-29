//
//  Game.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit

public struct Games: Codable {
    public let count: Int
    public let next: String
    public let results: [Result]
    public let seoTitle, seoDescription, seoKeywords, seoH1: String
    public let noindex, nofollow: Bool
    public let description: String
    public let filters: Filters
    public let nofollowCollections: [String]

    enum CodingKeys: String, CodingKey {
        case count, next, results
        case seoTitle = "seo_title"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case seoH1 = "seo_h1"
        case noindex, nofollow, description, filters
        case nofollowCollections = "nofollow_collections"
    }
    
    public init(
        count: Int,
        next: String,
        results: [Result],
        seoTitle: String,
        seoDescription: String,
        seoKeywords: String,
        seoH1: String,
        noindex: Bool,
        nofollow: Bool,
        description: String,
        filters: Filters,
        nofollowCollections: [String]
    ) {
        self.count = count
        self.next = next
        self.results = results
        self.seoTitle = seoTitle
        self.seoDescription = seoDescription
        self.seoKeywords = seoKeywords
        self.seoH1 = seoH1
        self.noindex = noindex
        self.nofollow = nofollow
        self.description = description
        self.filters = filters
        self.nofollowCollections = nofollowCollections
    }
}

public struct Filters: Codable {
    public let years: [FiltersYear]
    
    public init(years: [FiltersYear]) {
        self.years = years
    }
}

public struct FiltersYear: Codable {
    public let from, to: Int
    public let filter: String
    public let decade: Int
    public let years: [YearYear]
    public let nofollow: Bool
    public let count: Int
    
    public init(from: Int, to: Int, filter: String, decade: Int, years: [YearYear], nofollow: Bool, count: Int) {
        self.from = from
        self.to = to
        self.filter = filter
        self.decade = decade
        self.years = years
        self.nofollow = nofollow
        self.count = count
    }
}

public struct YearYear: Codable {
    public let year, count: Int
    public let nofollow: Bool
    
    public init(year: Int, count: Int, nofollow: Bool) {
        self.year = year
        self.count = count
        self.nofollow = nofollow
    }
}

public struct Result: Codable {
    public let id: Int
    public let slug, name, released: String
    public let tba: Bool
    public let backgroundImage: String
    public let rating: Double
    public let ratingTop: Int
    public let ratings: [Rating]
    public let ratingsCount, reviewsTextCount, added: Int
    public let addedByStatus: AddedByStatus
    public let metacritic, playtime, suggestionsCount: Int
    public let updated: String
    public let reviewsCount: Int
    public let saturatedColor, dominantColor: Color
    public let platforms: [PlatformElement]
    public let parentPlatforms: [ParentPlatform]
    public let genres: [Genre]
    public let stores: [Store]
    public let tags: [Genre]
    public let esrbRating: EsrbRating
    public let shortScreenshots: [ShortScreenshot]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case addedByStatus = "added_by_status"
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case updated
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case parentPlatforms = "parent_platforms"
        case genres, stores, tags
        case esrbRating = "esrb_rating"
        case shortScreenshots = "short_screenshots"
    }
    
    public init(
        id: Int,
        slug: String,
        name: String,
        released: String,
        tba: Bool,
        backgroundImage: String,
        rating: Double,
        ratingTop: Int,
        ratings: [Rating],
        ratingsCount: Int,
        reviewsTextCount: Int,
        added: Int,
        addedByStatus: AddedByStatus,
        metacritic: Int,
        playtime: Int,
        suggestionsCount: Int,
        updated: String,
        reviewsCount: Int,
        saturatedColor: Color,
        dominantColor: Color,
        platforms: [PlatformElement],
        parentPlatforms: [ParentPlatform],
        genres: [Genre],
        stores: [Store],
        tags: [Genre],
        esrbRating: EsrbRating,
        shortScreenshots: [ShortScreenshot]
    ) {
        self.id = id
        self.slug = slug
        self.name = name
        self.released = released
        self.tba = tba
        self.backgroundImage = backgroundImage
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratings = ratings
        self.ratingsCount = ratingsCount
        self.reviewsTextCount = reviewsTextCount
        self.added = added
        self.addedByStatus = addedByStatus
        self.metacritic = metacritic
        self.playtime = playtime
        self.suggestionsCount = suggestionsCount
        self.updated = updated
        self.reviewsCount = reviewsCount
        self.saturatedColor = saturatedColor
        self.dominantColor = dominantColor
        self.platforms = platforms
        self.parentPlatforms = parentPlatforms
        self.genres = genres
        self.stores = stores
        self.tags = tags
        self.esrbRating = esrbRating
        self.shortScreenshots = shortScreenshots
    }
}

public struct AddedByStatus: Codable {
    public let yet, owned, beaten, toplay: Int
    public let dropped, playing: Int
    
    public init(yet: Int, owned: Int, beaten: Int, toplay: Int, dropped: Int, playing: Int) {
        self.yet = yet
        self.owned = owned
        self.beaten = beaten
        self.toplay = toplay
        self.dropped = dropped
        self.playing = playing
    }
}

public enum Color: String, Codable {
    case the0F0F0F = "0f0f0f"
}

public struct EsrbRating: Codable {
    public let id: Int
    public let name, slug: String
    
    public init(id: Int, name: String, slug: String) {
        self.id = id
        self.name = name
        self.slug = slug
    }
}

public struct Genre: Codable {
    public let id: Int
    public let name, slug: String
    public let gamesCount: Int
    public let imageBackground: String
    public let domain: Domain?
    public let language: Language?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
    
    public init(id: Int, name: String, slug: String, gamesCount: Int, imageBackground: String, domain: Domain?, language: Language?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
        self.domain = domain
        self.language = language
    }
}

public enum Domain: String, Codable {
    case appsAppleCOM = "apps.apple.com"
    case epicgamesCOM = "epicgames.com"
    case gogCOM = "gog.com"
    case marketplaceXboxCOM = "marketplace.xbox.com"
    case microsoftCOM = "microsoft.com"
    case nintendoCOM = "nintendo.com"
    case playGoogleCOM = "play.google.com"
    case storePlaystationCOM = "store.playstation.com"
    case storeSteampoweredCOM = "store.steampowered.com"
}

public enum Language: String, Codable {
    case eng = "eng"
}

public struct ParentPlatform: Codable {
    public let platform: EsrbRating
    
    public init(platform: EsrbRating) {
        self.platform = platform
    }
}

public struct PlatformElement: Codable {
    public let platform: PlatformPlatform
    public let releasedAt: String
    public let requirementsEn, requirementsRu: Requirements?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
    
    public init(platform: PlatformPlatform, releasedAt: String, requirementsEn: Requirements?, requirementsRu: Requirements?) {
        self.platform = platform
        self.releasedAt = releasedAt
        self.requirementsEn = requirementsEn
        self.requirementsRu = requirementsRu
    }
}

public struct PlatformPlatform: Codable {
    public let id: Int
    public let name, slug: String
    public let yearStart: Int?
    public let gamesCount: Int
    public let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
    
    public init(id: Int, name: String, slug: String, yearStart: Int?, gamesCount: Int, imageBackground: String) {
        self.id = id
        self.name = name
        self.slug = slug
        self.yearStart = yearStart
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
    }
}

public struct Requirements: Codable {
    public let minimum: String
    public let recommended: String?
    
    public init(minimum: String, recommended: String?) {
        self.minimum = minimum
        self.recommended = recommended
    }
}

public struct Rating: Codable {
    public let id: Int
    public let title: Title
    public let count: Int
    public let percent: Double
    
    public init(id: Int, title: Title, count: Int, percent: Double) {
        self.id = id
        self.title = title
        self.count = count
        self.percent = percent
    }
}

public enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
}

public struct ShortScreenshot: Codable {
    public let id: Int
    public let image: String
    
    public init(id: Int, image: String) {
        self.id = id
        self.image = image
    }
}

public struct Store: Codable {
    public let id: Int
    public let store: Genre
    
    public init(id: Int, store: Genre) {
        self.id = id
        self.store = store
    }
}

public struct FavoriteGameData: Codable {
    public var id: Int64
    public var name: String
    public var rating: Double
    public var ratingTop: Int64
    public var released: String
    public var backgroundImage: String
    
    public init(id: Int64, name: String, rating: Double, ratingTop: Int64, released: String, backgroundImage: String) {
        self.id = id
        self.name = name
        self.rating = rating
        self.ratingTop = ratingTop
        self.released = released
        self.backgroundImage = backgroundImage
    }
}

public struct GameEntity {
    public let id: Int
    public let name: String
    public let released: String
    public let rating: Double
    public let ratingTop: Int
    public let backgroundImage: String
    
    public init(id: Int, name: String, released: String, rating: Double, ratingTop: Int, backgroundImage: String) {
        self.id = id
        self.name = name
        self.released = released
        self.rating = rating
        self.ratingTop = ratingTop
        self.backgroundImage = backgroundImage
    }
}
