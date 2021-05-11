import Combine
import Domain

final class TVShowsDataRepositoryMock: TVShowsRepository, AnyPubliserMockResponseWrapper {
    private (set)var calledCount = 0
    var response: [TVShow] = []
    var error: Error?

    func fetchTVShows(page: Int) -> AnyPublisher<[TVShow], Error> {
        calledCount += 1
        return wrapResponse()
    }
}
