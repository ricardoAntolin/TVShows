import Combine
import Data

public final class TVShowsNetworkProvider: TVShowsProvider {
    private let tvShowsAPI: TVShowsAPIDefinition

    public init(tvShowsAPI: TVShowsAPIDefinition) {
        self.tvShowsAPI = tvShowsAPI
    }

    public func fetchTVShows(page: Int) -> AnyPublisher<[TVShowDataModel], Error> {
        return tvShowsAPI.fetchTVShows(page: page)
            .map { $0.asDataEntity() }
            .eraseToAnyPublisher()
    }
}
