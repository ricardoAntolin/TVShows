import XCTest

@testable import NetworkProvider
@testable import TVShows

class TVShowsUITests: XCTestCase, UITest, Stubbing {
    var application: XCUIApplication!

    override func setUp() {
        application = .init()
    }

    func testHappyPath() {
        let id: Int = 1
        let name: String = "Under the Dome"
        application.launch()
        // Splash View
        assert(exists: SplashPageObject.splashViewText)

        // TVShows list
        assert(exists: TVShowsListPageObject.tvShowItem(id: id))
        tap(on: TVShowsListPageObject.tvShowItem(id: id))

        // TVShows details
        assert(exists: TVShowDetailsPageObject.tvShowDetailsTitle(title: name))

    }
}
