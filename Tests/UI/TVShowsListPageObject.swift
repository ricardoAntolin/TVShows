enum TVShowsListPageObject: PageObject {
    case tvShowItem

    var identifier: UIElement.Identifier {
        switch self {
        case .tvShowItem:
            return .text("")
        }
    }

    var kind: UIElement.Kind {
        switch self {
        case .tvShowItem:
            return .other
        }
    }

}
