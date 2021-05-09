import XCTest
import SwiftUI
import TVShowsSnapshotTesting

@testable import TVShows

class TVShowsScreenshotTest: XCTestCase, SnapshotTest {
    func testSplashView() {
        let givenStore = AppStore(
            initialState: .init(tvShows: [TVShowMother.uiModel()]),
            reducer: appReducer,
            environment: UseCaseProviderMock()
        )

        let givenView = SplashView().environmentObject(givenStore)
            .eraseToAnyView()

        assert(swiftUIView: givenView, waitFor: 6.0)
    }

    func testTVShowsListView() {
        let givenStore = AppStore(
            initialState: .init(tvShows: [TVShowMother.uiModel()]),
            reducer: appReducer,
            environment: UseCaseProviderMock()
        )

        let givenView = NavigationView {
            TVShowsListView().environmentObject(givenStore)
        }
        .accentColor(.red)
        .eraseToAnyView()

        assert(swiftUIView: givenView, waitFor: 5.0)
    }

    func testTVShowDetailsView() {

        let givenView = NavigationView {
            TVShowDetailsView(tvShow: TVShowMother.uiModel())
        }
        .accentColor(.red)
        .eraseToAnyView()

        assert(swiftUIView: givenView, waitFor: 5.0)
    }
}

func appReducerMock() {

}
