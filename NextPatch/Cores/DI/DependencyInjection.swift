//
//  DependencyInjection.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//
import Swinject

class DependencyInjection {
    static let shared = DependencyInjection()
    let container: Container

    private init() {
        container = Container()
        container.register(GameDataSource.self) { _ in GameDataSource() }
        container.register(GameRepository.self) { resolver in
            GameRepository(gameDataSource: resolver.resolve(GameDataSource.self)) }
        container.register(GamesUseCase.self) { resolver in
            GamesUseCase(repository: resolver.resolve(GameRepository.self)!)
        }
        container.register(HomeViewModels.self) { resolver in
            HomeViewModels(getAllGamesUseCase: resolver.resolve(GamesUseCase.self)!)
        }
        container.register(DetailViewModels.self) { resolver in
            DetailViewModels(getAllGamesUseCase: resolver.resolve(GamesUseCase.self)!)
        }
        container.register(FavoriteViewModels.self) { resolver in
            FavoriteViewModels(getAllGamesUseCase: resolver.resolve(GamesUseCase.self)!)
        }
    }
}
