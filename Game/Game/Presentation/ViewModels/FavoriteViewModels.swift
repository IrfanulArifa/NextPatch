//
//  FavoriteViewModels.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 17/08/25.
//

import Combine
import UIKit

public class FavoriteViewModels: ObservableObject {
//    @Published var gameData: [FavoriteGameData] = []
    
    public var cancellables = Set<AnyCancellable>()
    private let getAllGameUseCases: GamesUseCase
    public init(getAllGamesUseCase: GamesUseCase) {
        self.getAllGameUseCases = getAllGamesUseCase
    }
}

extension FavoriteViewModels {
//    func getFavoriteGames() {
//        gameData = getAllGameUseCases.getFavoriteGames()
//    }
}
