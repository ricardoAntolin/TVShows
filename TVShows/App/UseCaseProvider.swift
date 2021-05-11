import Domain

protocol UseCaseProvider {
    var repositoryProvider: RepositoryProvider { get }
}

final class UseCaseProviderImp: UseCaseProvider {

    let repositoryProvider: RepositoryProvider

    init(repositoryProvider: RepositoryProvider) {
        self.repositoryProvider = repositoryProvider
    }

}
