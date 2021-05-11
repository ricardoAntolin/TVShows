import NetworkProvider
import Combine

final class TVShowsAPIDefinitionMock: TVShowsAPIDefinition {
    private(set) var calledCount = 0
    var tvShows: [TVShowAPIModel] = []
    var error: Error?

    func fetchTVShows(page: Int) -> AnyPublisher<[TVShowAPIModel], Error> {
        calledCount += 1

        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }

        return Just(tvShows)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
