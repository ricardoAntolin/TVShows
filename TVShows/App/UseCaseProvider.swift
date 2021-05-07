import Domain

final class UseCaseProvider {

    private let repositoryProvider: RepositoryProvider

    init(repositoryProvider: RepositoryProvider) {
        self.repositoryProvider = repositoryProvider
    }

}
