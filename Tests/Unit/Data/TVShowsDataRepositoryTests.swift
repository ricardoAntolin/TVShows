import XCTest
import Combine

@testable import Data

final class TVShowsDataRepositoryTests: XCTestCase {
    private var repository: TVShowsDataRepository!
    private var provider: TVShowsProviderMock!

    override func setUp() {
        provider = TVShowsProviderMock()
        repository = TVShowsDataRepository(networkProvider: provider)
    }

    func testFetchTVShows() {
        let giventvShows: [TVShowDataModel] = [TVShowMother.dataModel()]
        let givenPage = 1

        provider.response = giventvShows
        let response = try! await(repository.fetchTVShows(page: givenPage))

        XCTAssertEqual(response, [TVShowMother.domainModel()])
        XCTAssertEqual(provider.calledCount, 1)
    }
}
