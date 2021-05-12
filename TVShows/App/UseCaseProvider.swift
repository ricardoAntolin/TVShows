import Domain

protocol UseCaseProvider {
    var repositoryProvider: RepositoryProvider { get }
    var getTVShowsPageUseCase: GetTVShowsPageUseCase { get }
}

final class UseCaseProviderImp: UseCaseProvider {

    let repositoryProvider: RepositoryProvider

    lazy var getTVShowsPageUseCase: GetTVShowsPageUseCase = {
        return GetTVShowsPage(repository: repositoryProvider.tvShowsRepository)
    }()

    init(repositoryProvider: RepositoryProvider) {
        self.repositoryProvider = repositoryProvider
    }

}
