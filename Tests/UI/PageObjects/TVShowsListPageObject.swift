enum TVShowsListPageObject: PageObject {
    case tvShowItem(id: Int)

    var identifier: UIElement.Identifier {
        switch self {
        case .tvShowItem(let id):
            return .accessibility(id: "TVShowItemView \(id)-TVShowItemView \(id)")
        }
    }

    var kind: UIElement.Kind {
        switch self {
        case .tvShowItem:
            return .button
        }
    }

}
