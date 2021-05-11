import Foundation
import Combine

public protocol TVShowsAPIDefinition {
    func fetchTVShows(page: Int) -> AnyPublisher<[TVShowAPIModel], Error>
}

public final class TVShowsAPI: TVShowsAPIDefinition {

    private let httpClient: HTTPClientRequestHandling

    public init(httpClient: HTTPClientRequestHandling) {
        self.httpClient = httpClient
    }

    public func fetchTVShows(page: Int) -> AnyPublisher<[TVShowAPIModel], Error> {
        return httpClient.request(
            requestDefinition: TVShowsRequestDefinition.getTVShows(page: page)
        )
    }
}
