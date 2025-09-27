//
//  GameFilterTest.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

import XCTest
@testable import NextPatch

final class GameFilterTest: XCTestCase {
    
    var dummyGames: [Result]!
    
    override func setUp() {
        super.setUp()
        dummyGames = [
            Result(id: 1, slug: "slug-1", name: "The Witcher 3", released: "", tba: false, backgroundImage: "", rating: 0, ratingTop: 0, ratings: [], ratingsCount: 0, reviewsTextCount: 0, added: 0, addedByStatus: AddedByStatus(yet: 0, owned: 0, beaten: 0, toplay: 0, dropped: 0, playing: 0), metacritic: 0, playtime: 0, suggestionsCount: 0, updated: "", reviewsCount: 0, saturatedColor: .the0F0F0F, dominantColor: .the0F0F0F, platforms: [], parentPlatforms: [], genres: [], stores: [], tags: [], esrbRating: EsrbRating(id: 0, name: "", slug: ""), shortScreenshots: []),
            Result(id: 2, slug: "slug-2", name: "Cyberpunk 2077", released: "", tba: false, backgroundImage: "", rating: 0, ratingTop: 0, ratings: [], ratingsCount: 0, reviewsTextCount: 0, added: 0, addedByStatus: AddedByStatus(yet: 0, owned: 0, beaten: 0, toplay: 0, dropped: 0, playing: 0), metacritic: 0, playtime: 0, suggestionsCount: 0, updated: "", reviewsCount: 0, saturatedColor: .the0F0F0F, dominantColor: .the0F0F0F, platforms: [], parentPlatforms: [], genres: [], stores: [], tags: [], esrbRating: EsrbRating(id: 0, name: "", slug: ""), shortScreenshots: [])
        ]
    }
    
    override func tearDown() {
        dummyGames = nil
        super.tearDown()
    }
    
    func testFilterHighRatedGames() {
        let filtered = dummyGames.filter { $0.name.localizedCaseInsensitiveContains("witcher")}
        
        XCTAssertEqual(filtered.count, 1, "Harusnya ada 1 game nama witcher")
        XCTAssertTrue(filtered.contains(where: { $0.name.localizedCaseInsensitiveContains("witcher") }))
    }
}
