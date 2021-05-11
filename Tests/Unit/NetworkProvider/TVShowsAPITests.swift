import XCTest
import Combine

@testable import NetworkProvider

class TVShowsAPITests: XCTestCase, Stubbing {
    private var tvShowsAPI: TVShowsAPI!

    override func setUp() {
        tvShowsAPI = TVShowsAPI(
            httpClient: HTTPClient(
                baseURL: URL(string: "http://fakeurl.com")!
            )
        )
    }

    func testFetchTVShows() {
        let givenPage = 0
        let givenFixture = TVShowsFixture().getTVShowsFixture()
        stubRequest(
            .get,
            path: TVShowsRequestDefinition.getTVShows(page: givenPage).path,
            responseType: .success(givenFixture)
        )

        let expectedResponse: [TVShowAPIModel] = [TVShowMother.apiModel()]
        let response: [TVShowAPIModel] = try! await(
            tvShowsAPI.fetchTVShows(page: givenPage)
        )

        XCTAssertEqual(expectedResponse, response)
    }
}
