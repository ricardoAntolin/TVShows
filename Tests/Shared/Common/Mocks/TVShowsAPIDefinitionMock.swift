import NetworkProvider
import Combine

final class TVShowsAPIDefinitionMock: TVShowsAPIDefinition, AnyPubliserMockResponseWrapper {
    private (set)var calledCount = 0
    var response: [TVShowAPIModel] = []
    var error: Error?

    func fetchTVShows(page: Int) -> AnyPublisher<[TVShowAPIModel], Error> {
        calledCount += 1
        return wrapResponse()
    }
}
