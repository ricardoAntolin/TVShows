import Combine
import Domain

final class GetTVShowsPageUseCaseMock: GetTVShowsPageUseCase, AnyPubliserMockResponseWrapper {
    private (set)var calledCount = 0
    var response: [TVShow] = []
    var error: Error?

    func execute(page: Int) -> AnyPublisher<[TVShow], Error> {
        calledCount += 1
        return wrapResponse()
    }
}
