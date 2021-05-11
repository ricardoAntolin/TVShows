import XCTest
import Combine

@testable import Domain

final class GetTVShowsPageUseCaseTests: XCTestCase {
    private var repository: TVShowsDataRepositoryMock!
    private var useCase: GetTVShowsPageUseCase!

    override func setUp() {
        repository = TVShowsDataRepositoryMock()
        useCase = GetTVShowsPage(repository: repository)
    }

    func testUseCase() {
        let giventvShows: [TVShow] = [TVShowMother.domainModel()]
        let givenPage = 1

        repository.response = giventvShows
        let response = try! await(useCase.execute(page: givenPage))

        XCTAssertEqual(response, [TVShowMother.domainModel()])
        XCTAssertEqual(repository.calledCount, 1)
    }
}
