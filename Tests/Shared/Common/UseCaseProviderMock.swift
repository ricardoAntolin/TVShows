import NetworkProvider
import Combine

final class UseCaseProviderMock: UseCaseProvider {
    var repositoryProvider: RepositoryProvider = RepositoryProviderMock()
}

final class RepositoryProviderMock: RepositoryProvider {
    var httpClient: HTTPClientRequestHandling = HTTPClientMock()
}

final class HTTPClientMock: HTTPClientRequestHandling {
    func request<T>(requestDefinition: RequestDefinition) -> AnyPublisher<T, Error> where T: Decodable {
        return Empty().eraseToAnyPublisher()
    }
}
