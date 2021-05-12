import XCTest
import Combine

@testable import TVShows
@testable import Domain

final class AppReducerTests: XCTestCase {
    private var state: AppState!
    private var useCaseProviderMock: UseCaseProvider!
    private var getTVShowsPageUseCaseMock: GetTVShowsPageUseCaseMock!
    private let preExistingTVShows: [TVShowUIModel] = [TVShowMother.uiModel(id: 2)]

    override func setUp() {
        state = AppState(tvShows: preExistingTVShows)
        getTVShowsPageUseCaseMock = GetTVShowsPageUseCaseMock()
        useCaseProviderMock = UseCaseProviderMock(getTVShowsPageUseCase: getTVShowsPageUseCaseMock)
    }

    func testSetAction() {
        let givenTVShows: [TVShowUIModel] = [TVShowMother.uiModel()]
        try! awaitEmpty(
            appReducer(
                state: &state,
                action: AppAction.setTVShows(tvShows: givenTVShows),
                useCaseProvider: useCaseProviderMock
            )
        ).get()

        XCTAssertEqual(givenTVShows, state.tvShows)
        XCTAssertEqual(getTVShowsPageUseCaseMock.calledCount, 0)
    }

    func testUpdateAction() {
        let givenTVShows: [TVShowUIModel] = [TVShowMother.uiModel()]
        try! awaitEmpty(
            appReducer(
                state: &state,
                action: AppAction.updateTVShows(tvShows: givenTVShows),
                useCaseProvider: useCaseProviderMock
            )
        ).get()

        XCTAssertEqual(preExistingTVShows + givenTVShows, state.tvShows)
        XCTAssertEqual(getTVShowsPageUseCaseMock.calledCount, 0)
    }

    func testfetchPageActionForFirstPage() {
        let givenTVShows: [TVShow] = [TVShowMother.domainModel()]
        getTVShowsPageUseCaseMock.response = givenTVShows

        let result = try! await(
            appReducer(
                state: &state,
                action: AppAction.fetchPage(page: 0),
                useCaseProvider: useCaseProviderMock
            )
        )

        let expectedTVShows: [TVShowUIModel] = [TVShowMother.uiModel()]
        XCTAssertEqual(result, AppAction.setTVShows(tvShows: expectedTVShows))
        XCTAssertEqual(getTVShowsPageUseCaseMock.calledCount, 1)
    }

    func testfetchPageActionForSecondPage() {
        let givenTVShows: [TVShow] = [TVShowMother.domainModel()]
        getTVShowsPageUseCaseMock.response = givenTVShows

        let result = try! await(
            appReducer(
                state: &state,
                action: AppAction.fetchPage(page: 2),
                useCaseProvider: useCaseProviderMock
            )
        )

        let expectedTVShows: [TVShowUIModel] = [TVShowMother.uiModel()]
        XCTAssertEqual(result, AppAction.updateTVShows(tvShows: expectedTVShows))
        XCTAssertEqual(getTVShowsPageUseCaseMock.calledCount, 1)
    }
}
