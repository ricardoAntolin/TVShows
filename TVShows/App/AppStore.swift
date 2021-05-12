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

extension AppAction: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.setTVShows(let lhsTVShows), .setTVShows(let rhsTVShows)):
            return lhsTVShows == rhsTVShows
        case (.updateTVShows(let lhsTVShows), .updateTVShows(let rhsTVShows)):
            return lhsTVShows == rhsTVShows
        case (.fetchPage(let lhsPage), .fetchPage(let rhsPage)):
            return lhsPage == rhsPage
        default:
            return false
        }
    }
}

func appReducer(
    state: inout AppState,
    action: AppAction,
    useCaseProvider: UseCaseProvider
) -> AnyPublisher<AppAction, Never> {
    switch action {
    case let .updateTVShows(tvShows):
        state.tvShows += tvShows
    case let .setTVShows(tvShows):
        state.tvShows = tvShows
    case let .fetchPage(page):
        return handleFetchPageAction(useCaseProvider: useCaseProvider, page: page)
    }
    return Empty().eraseToAnyPublisher()
}

private func handleFetchPageAction(
    useCaseProvider: UseCaseProvider,
    page: Int
) -> AnyPublisher<AppAction, Never> {
    return useCaseProvider
        .getTVShowsPageUseCase
        .execute(page: page)
        .replaceError(with: [])
        .map {
            guard page != 0 else { return AppAction.setTVShows(tvShows: $0.asUIModel()) }
            return AppAction.updateTVShows(tvShows: $0.asUIModel())
        }.eraseToAnyPublisher()
}

typealias AppStore = Store<AppState, AppAction, UseCaseProvider>
