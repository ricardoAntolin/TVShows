import NetworkProvider
import Data
import Domain
import Combine

@testable import TVShows

final class UseCaseProviderMock: UseCaseProvider {
    var getTVShowsPageUseCase: GetTVShowsPageUseCase = GetTVShowsPageUseCaseMock()

    var repositoryProvider: RepositoryProvider = RepositoryProviderMock()
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
