import Swinject
import NextPatchGame

class DependencyInjection {
    static let shared = DependencyInjection()
    let container: Container

    private init() {
        container = Container()

        // DataSource
        container.register(GameDataSourceProtocol.self) { _ in GameDataSource() }

        // Repository
        container.register(GameRepository.self) { resolver in
            guard let ds = resolver.resolve(GameDataSourceProtocol.self) else {
                fatalError("GameDataSourceProtocol not resolved")
            }
            return GameRepository(gameDataSource: ds as? GameDataSource)
        }

        // UseCase
        container.register(GamesUseCase.self) { resolver in
            guard let repo = resolver.resolve(GameRepository.self) else {
                fatalError("GameRepository not resolved")
            }
            return GamesUseCase(repository: repo)
        }

        // ViewModels
        container.register(HomeViewModels.self) { resolver in
            guard let usecase = resolver.resolve(GamesUseCase.self) else {
                fatalError("GamesUseCase not resolved")
            }
            return HomeViewModels(getAllGamesUseCase: usecase)
        }

        container.register(DetailViewModels.self) { resolver in
            guard let usecase = resolver.resolve(GamesUseCase.self) else {
                fatalError("GamesUseCase not resolved")
            }
            return DetailViewModels(getAllGamesUseCase: usecase)
        }

        container.register(FavoriteViewModels.self) { resolver in
            guard let usecase = resolver.resolve(GamesUseCase.self) else {
                fatalError("GamesUseCase not resolved")
            }
            return FavoriteViewModels(getAllGamesUseCase: usecase)
        }
    }
}
