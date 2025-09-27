//
//  GameMapper.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 17/08/25.
//

import Foundation

extension GameDetails {
    func toFavoriteData() -> FavoriteGameData {
        return FavoriteGameData(
            id: Int64(self.id),
            name: self.name,
            rating: self.rating,
            ratingTop: Int64(self.ratingTop),
            released: self.released,
            backgroundImage: self.backgroundImage
        )
    }
}

extension FavoriteGame {
    func toDomain() -> FavoriteGameData {
        return FavoriteGameData(
            id: self.id,
            name: self.name ?? "",
            rating: self.rating,
            ratingTop: self.ratingTop,
            released: self.released ?? "",
            backgroundImage: self.backgroundImage ?? ""
        )
    }
}

extension Result {
    func toEntity() -> GameEntity {
        return GameEntity(
            id: self.id,
            name: self.name,
            released: self.released,
            rating: self.rating,
            ratingTop: self.ratingTop,
            backgroundImage: self.backgroundImage
        )
    }
}

extension Array where Element == Result {
    func toEntities() -> [GameEntity] {
        return self.map { $0.toEntity() }
    }
}


// MARK: GENRES
extension GenresResponse {
    func toEntity() -> GenreEntity {
        return GenreEntity(
            id: self.id,
            name: self.name,
            slug: self.slug,
            gamesCount: self.gamesCount,
            imageBackground: self.imageBackground
        )
    }
}

extension Array where Element == GenresResponse {
    func toEntities() -> [GenreEntity] {
        return self.map { $0.toEntity() }
    }
}

extension GameDetails {
    func toEntity() -> GameDetailsEntity {
        return GameDetailsEntity(
            id: self.id,
            name: self.name,
            released: self.released,
            backgroundImage: self.backgroundImage,
            rating: self.rating,
            ratingTop: self.ratingTop,
            description: self.description,
            descriptionRaw: self.descriptionRaw,
            developers: self.developers.map { $0.toEntity() },
            genres: self.genres.map { $0.toEntity() },
            tags: self.tags.map { $0.toEntity() },
            publishers: self.publishers.map { $0.toEntity() }
        )
    }
}

extension GameDetailsEntity {
    func toFavoriteData() -> FavoriteGameData {
        return FavoriteGameData(
            id: Int64(self.id),
            name: self.name,
            rating: self.rating,
            ratingTop: Int64(self.ratingTop),
            released: self.released,
            backgroundImage: self.backgroundImage
        )
    }
}

extension Developer {
    func toEntity() -> DeveloperEntity {
        return DeveloperEntity(
            id: self.id,
            name: self.name,
            imageBackground: self.imageBackground
        )
    }
}

extension GameDetailsEntity {
    static let empty = GameDetailsEntity(
        id: 0,
        name: "",
        released: "",
        backgroundImage: "",
        rating: 0,
        ratingTop: 0,
        description: "",
        descriptionRaw: "",
        developers: [],
        genres: [],
        tags: [],
        publishers: []
    )
}
