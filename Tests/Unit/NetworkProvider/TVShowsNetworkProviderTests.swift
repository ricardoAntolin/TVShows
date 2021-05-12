import XCTest
import Combine

@testable import NetworkProvider

class TVShowsNetworkProviderTests: XCTestCase {
    private var provider: TVShowsNetworkProvider!
    private var tvShowsAPIMock: TVShowsAPIDefinitionMock!

    override func setUp() {
        tvShowsAPIMock = TVShowsAPIDefinitionMock()
        provider = TVShowsNetworkProvider(tvShowsAPI: tvShowsAPIMock)
    }

    func testFetchTVShows() {
        let giventvShows: [TVShowAPIModel] = [TVShowMother.apiModel()]
        let givenPage = 1

        tvShowsAPIMock.response = giventvShows
        let response = try! await(provider.fetchTVShows(page: givenPage))

        XCTAssertEqual(response, [TVShowMother.dataModel()])
        XCTAssertEqual(tvShowsAPIMock.calledCount, 1)
    }
}
