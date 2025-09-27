//
//  FavoriteViewModels.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 17/08/25.
//

import Combine
import UIKit
import Game

class FavoriteViewModels: ObservableObject {
//    @Published var gameData: [FavoriteGameData] = []
    
    var cancellables = Set<AnyCancellable>()
    private let getAllGameUseCases: GamesUseCase
    init(getAllGamesUseCase: GamesUseCase) {
        self.getAllGameUseCases = getAllGamesUseCase
    }
}

extension FavoriteViewModels {
//    func getFavoriteGames() {
//        gameData = getAllGameUseCases.getFavoriteGames()
//    }
}
