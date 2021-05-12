enum TVShowDetailsPageObject: PageObject {
    case tvShowDetailsTitle(title: String)
    case tvShowDetailsImage
    case tvShowDetailsSummary

    var identifier: UIElement.Identifier {
        switch self {
        case .tvShowDetailsTitle(let title):
            return .accessibility(id: "TVShowDetailsViewTitle \(title)")
        case .tvShowDetailsImage:
            return .accessibility(id: "TVShowDetailsViewImage")
        case .tvShowDetailsSummary:
            return .accessibility(id: "TVShowDetailsViewSummary")
        }
    }

    var kind: UIElement.Kind {
        switch self {
        case .tvShowDetailsTitle:
            return .label
        case .tvShowDetailsImage:
            return .image
        case .tvShowDetailsSummary:
            return .label
        }
    }

}
