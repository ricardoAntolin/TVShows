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
        #warning("TODO Call to usecase")
    }
    return Empty().eraseToAnyPublisher()
}

typealias AppStore = Store<AppState, AppAction, UseCaseProvider>
