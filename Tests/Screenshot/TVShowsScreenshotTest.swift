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

        let givenView = SplashView(scale: 3, opacity: 1)
            .background(Color.black)
            .environmentObject(givenStore)
            .eraseToAnyView()

        assert(swiftUIView: givenView)
    }

    func testTVShowsListView() {
        let givenStore = AppStore(
            initialState: .init(tvShows: [TVShowMother.uiModel()]),
            reducer: appReducer,
            environment: UseCaseProviderMock()
        )

        let givenView = NavigationView {
            TVShowsListView()
                .environmentObject(givenStore)
        }
        .accentColor(.red)
        .eraseToAnyView()

        assert(swiftUIView: givenView)
    }

    func testTVShowDetailsView() {

        let givenView = NavigationView {
            TVShowDetailsView(tvShow: TVShowMother.uiModel())
        }
        .background(Color.black)
        .accentColor(.red)
        .eraseToAnyView()

        assert(swiftUIView: givenView)
    }
}
