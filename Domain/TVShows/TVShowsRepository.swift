import Combine

public protocol TVShowsRepository {
    func fetchTVShows(page: Int) -> AnyPublisher<[TVShow], Error>
}
