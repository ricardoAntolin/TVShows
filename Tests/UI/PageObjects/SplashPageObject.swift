enum SplashPageObject: PageObject {
    case splashViewText

    var identifier: UIElement.Identifier {
        switch self {
        case .splashViewText:
            return .accessibility(id: "SplashViewText")
        }
    }

    var kind: UIElement.Kind {
        switch self {
        case .splashViewText:
            return .label
        }
    }
}
