import XCTest

class TVShowsUITests: XCTestCase, UITest, Stubbing {
    var application: XCUIApplication!

    override func setUp() {
        application = .init()
    }

    func testHappyPath() {
        application.launch()
        // TODO complete flow
    }
}
