import Combine
import Domain

public final class TVShowsDataRepository: TVShowsRepository {

    private let networkProvider: TVShowsProvider

    public init(networkProvider: TVShowsProvider) {
        self.networkProvider = networkProvider
    }

    public func fetchTVShows(page: Int) -> AnyPublisher<[TVShow], Error> {
        return networkProvider.fetchTVShows(page: page)
            .map { $0.asDomain() }
            .eraseToAnyPublisher()
    }
}
