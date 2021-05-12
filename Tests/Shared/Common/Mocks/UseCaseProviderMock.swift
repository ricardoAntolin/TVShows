import NetworkProvider
import Data
import Domain
import Combine

@testable import TVShows

final class UseCaseProviderMock: UseCaseProvider {
    var getTVShowsPageUseCase: GetTVShowsPageUseCase
    var repositoryProvider: RepositoryProvider

    init(
        getTVShowsPageUseCase: GetTVShowsPageUseCase = GetTVShowsPageUseCaseMock(),
        repositoryProvider: RepositoryProvider = RepositoryProviderMock()
    ) {
        self.getTVShowsPageUseCase = getTVShowsPageUseCase
        self.repositoryProvider = repositoryProvider
    }
}

final class RepositoryProviderMock: RepositoryProvider {
    var tvShowsRepository: TVShowsRepository = TVShowsDataRepositoryMock()

    var httpClient: HTTPClientRequestHandling = HTTPClientMock()
}

final class HTTPClientMock: HTTPClientRequestHandling {
    func request<T>(requestDefinition: RequestDefinition) -> AnyPublisher<T, Error> where T: Decodable {
        return Empty().eraseToAnyPublisher()
    }
}
