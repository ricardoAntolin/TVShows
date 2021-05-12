import Combine

public protocol GetTVShowsPageUseCase {
    func execute(page: Int) -> AnyPublisher<[TVShow], Error>
}

public struct GetTVShowsPage: GetTVShowsPageUseCase {
    private let repository: TVShowsRepository

    public init(repository: TVShowsRepository) {
        self.repository = repository
    }

    public func execute(page: Int) -> AnyPublisher<[TVShow], Error> {
        return repository.fetchTVShows(page: page)
    }
}
