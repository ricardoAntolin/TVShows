import Foundation

public enum StopsRequestDefinition {
    case getTVShows(page: Int)
}

extension StopsRequestDefinition: RequestDefinition {
    public var path: String {
        switch self {
        case .getTVShows:
            return "/shows"
        }
    }

    public var parameters: APIParameters? {
        switch self {
        case .getTVShows(let page):
            return ["page": page]
        }
    }
}
