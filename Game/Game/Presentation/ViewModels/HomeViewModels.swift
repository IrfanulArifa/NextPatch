//
//  HomeViewModels.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 04/08/25.
//

import Combine
import UIKit

public class HomeViewModels: ObservableObject {
    @Published public var games: [GameEntity] = []
    @Published public var tempGames: [GameEntity] = []
    @Published public var genres: [GenreEntity] = []
    public var cancellables = Set<AnyCancellable>()
    private let getAllGamesUseCase: GamesUseCase
    public init(getAllGamesUseCase: GamesUseCase) {
        self.getAllGamesUseCase = getAllGamesUseCase
    }
}

extension HomeViewModels {
    public func filterGames(by text: String) {
        if text.isEmpty {
            games = tempGames
        } else {
            games = tempGames.filter {
                $0.name.localizedCaseInsensitiveContains(text)
            }
        }
    }
}

// MARK: APIs Call
extension HomeViewModels {
    public func fetchGames() {
        getAllGamesUseCase.getGamesData()
            .map { $0.results.toEntities() }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] games in
                self?.games = games
                self?.tempGames = games
            }
            .store(in: &cancellables)
    }
    
    public func fetchGenres() {
        getAllGamesUseCase.getGenresData()
            .map { $0.results.toEntities() }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] genres in
                self?.genres = genres
            }
            .store(in: &cancellables)
    }
}
