import Foundation
import Combine

// MARK: - Network Controller
public protocol HTTPClientRequestHandling: class {
    func request<T: Decodable>(requestDefinition: RequestDefinition) -> AnyPublisher<T, Error>
}

public final class HTTPClient: HTTPClientRequestHandling {

    private let session: URLSession
    private let baseURL: URL

    public init(
        session: URLSession = .shared,
        baseURL: URL
    ) {
        self.session = session
        self.baseURL = baseURL
    }

    public func request<T: Decodable>(requestDefinition: RequestDefinition) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: buildRequest(requestDefinition))
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func buildRequest(_ definition: RequestDefinition) -> URLRequest {
        var request = definition.buildRequest(baseURL: baseURL)
        request.allHTTPHeaderFields = definition.headers
        return request
    }
}
