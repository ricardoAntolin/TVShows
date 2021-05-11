import Combine
import Data

final class TVShowsProviderMock: TVShowsProvider, AnyPubliserMockResponseWrapper {
    private (set)var calledCount = 0
    var response: [TVShowDataModel] = []
    var error: Error?

    func fetchTVShows(page: Int) -> AnyPublisher<[TVShowDataModel], Error> {
        calledCount += 1
        return wrapResponse()
    }
}
