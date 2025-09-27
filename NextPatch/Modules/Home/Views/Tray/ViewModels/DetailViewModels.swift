//
//  DetailViewModels.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

import Combine
import UIKit
import Game

class DetailViewModels: ObservableObject {
    @Published var gameDetails: GameDetailsEntity?
    
    var cancellables = Set<AnyCancellable>()
    private let getAllGamesUseCases: GamesUseCase
    
    init(getAllGamesUseCase: GamesUseCase) {
        self.getAllGamesUseCases = getAllGamesUseCase
    }
}

// MARK: APIs Call
extension DetailViewModels {
    func fetchDetail(id: Int) {
        getAllGamesUseCases.getGameDetailData(id: id)
            .map { $0.toEntity() }
            .replaceError(with: .empty)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] gameDetails in
                self?.gameDetails = gameDetails
            }
            .store(in: &cancellables)
    }
}



