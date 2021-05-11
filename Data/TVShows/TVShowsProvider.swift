import Combine

public protocol TVShowsProvider {
    func fetchTVShows(page: Int) -> AnyPublisher<[TVShowDataModel], Error>
}
