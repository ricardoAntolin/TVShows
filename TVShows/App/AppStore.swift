import Foundation
import Combine

struct AppState {
    var tvShows: [TVShowUIModel] = []
}

enum AppAction {
    case setTVShows(tvShows: [TVShowUIModel])
    case updateTVShows(tvShows: [TVShowUIModel])
    case fetchPage(page: Int)
}

func appReducer(
    state: inout AppState,
    action: AppAction,
    environment: UseCaseProvider
) -> AnyPublisher<AppAction, Never> {
    switch action {
    case let .updateTVShows(tvShows):
        state.tvShows += tvShows
    case let .setTVShows(tvShows):
        state.tvShows = tvShows
    case let .fetchPage(page):
        let tvShow = TVShowMother.uiModel()

        if page == 0 {
            return Just(AppAction.setTVShows(tvShows: [tvShow]))
                .eraseToAnyPublisher()
        }
        return Just(AppAction.updateTVShows(tvShows: [tvShow]))
            .eraseToAnyPublisher()
        #warning("TODO Call to usecase")
    }
    return Empty().eraseToAnyPublisher()
}

typealias AppStore = Store<AppState, AppAction, UseCaseProvider>
