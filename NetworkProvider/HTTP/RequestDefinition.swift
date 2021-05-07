import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum ParameterEncoding {
    case json
    case url(destination: Destination)

    public enum Destination {
        case httpBody
        case queryString
    }
}

public protocol APIParameters { }

extension Array: APIParameters { }
extension Dictionary: APIParameters { }

public enum ContentType {
    case json

    public var rawValue: String {
        switch self {
        case .json: return "application/json"
        }
    }
}

public protocol RequestDefinition {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: APIParameters? { get }
    var headers: [String: String] { get }
    var encoding: ParameterEncoding { get }
    var contentType: ContentType { get }
    var requestTimestamp: Date { get }
}

extension RequestDefinition {
    public var parameters: APIParameters? { return nil }
    public var headers: [String: String] { return [String: String]()  }
    public var method: HTTPMethod { return .get }
    public var encoding: ParameterEncoding {
        switch method {
        case .put, .post, .patch:
            return .json
        default:
            return .url(destination: .queryString)
        }
    }

    public var contentType: ContentType { return .json }
    public var requestTimestamp: Date { return Date() }
}

// MARK: - Request

extension RequestDefinition {
    func buildRequest(baseURL: URL) -> URLRequest {
        var components = URLComponents(string: baseURL.appendingPathComponent(path).absoluteString)!
        components.queryItems = queryParams
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        // request.httpBody = httpBody
        request.allHTTPHeaderFields = headers
        return request
    }
}

// MARK: - Query

extension RequestDefinition {
    var queryParams: [URLQueryItem]? {
        guard case let .url(destination) = encoding,
              case .queryString = destination,
              let parametersDictionary = parameters as? [String: Any]
        else { return nil }
        return parametersDictionary.map {
            let value = $0.value as? String ?? String(describing: $0.value)
            return URLQueryItem(name: $0.key, value: value)
        }
    }
}

// MARK: - HTTP Body

extension RequestDefinition {
    var httpBody: Data? {
        return try? JSONSerialization.data(withJSONObject: parameters ?? [:])
    }
}
