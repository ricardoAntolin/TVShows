import Foundation
import OHHTTPStubs

@testable import NetworkProvider

protocol Stubbing {
    func removeAllStubs()
    func stubRequest(_ method: HTTPMethod,
                     path: String,
                     responseType: StubResponseType)
    func stubRequest(_ method: HTTPMethod,
                     regex: String,
                     responseType: StubResponseType,
                     requestTime: TimeInterval,
                     responseTime: TimeInterval)
    func stubAllRequestsToFailByDefault()
    func logAllStubs()
}

extension Stubbing {
    func removeAllStubs() {
        HTTPStubs.removeAllStubs()
    }

    func stubRequest(_ method: HTTPMethod = .get,
                     path: String,
                     responseType: StubResponseType) {
        stub { (req) -> Bool in
            return req.url?.path == path && method.condition(req)
        } response: { (_) -> HTTPStubsResponse in
            return responseType.stubsResponse
        }
    }

    func stubRequest(_ method: HTTPMethod = .get,
                     regex: String,
                     responseType: StubResponseType,
                     requestTime: TimeInterval = 0.0,
                     responseTime: TimeInterval = 0.0) {
        stub { (req) -> Bool in
            return self.pathMatches(req: req as NSURLRequest, regexString: regex) // && method.condition
        } response: { (_) -> HTTPStubsResponse in
            return responseType.stubsResponse.requestTime(requestTime, responseTime: responseTime)
        }
    }

    func stubAllRequestsToFailByDefault() {
        stub { (req) -> Bool in
            return self.pathMatches(req: req as NSURLRequest, regexString: ".*")
        } response: { (_) -> HTTPStubsResponse in
            return HTTPStubsResponse(error: NSError(domain: "", code: 404, userInfo: nil))
        }
    }

    func logAllStubs() {
        HTTPStubs.onStubActivation { (request, stub, _) in
            print("\(request.url!) stubbed by \(String(describing: stub.name))")
        }
    }

    @discardableResult
    private func stub(condition: @escaping HTTPStubsTestBlock,
                      response: @escaping HTTPStubsResponseBlock) -> HTTPStubsDescriptor {
        return HTTPStubs.stubRequests(passingTest: condition, withStubResponse: response)
    }

    private func pathMatches(
        req: NSURLRequest,
        regexString: String,
        options: NSRegularExpression.Options = []
    ) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regexString, options: options) else {
            return false
        }
        return pathMatches(req: req, regex: regex)
    }

    private func pathMatches(req: NSURLRequest,
                             regex: NSRegularExpression) -> Bool {
        guard let path = req.url?.path else { return false }
        let range = NSRange(location: 0, length: path.utf16.count)

        return regex.firstMatch(in: path, options: [], range: range) != nil
    }

    private func isPath(_ path: String) -> HTTPStubsTestBlock {
        return { req in req.url?.path == path }
    }
}

extension HTTPMethod {
    var condition: HTTPStubsTestBlock {
        return { req in
            switch self {
            case .get:
                return req.httpMethod == "GET"
            case .put:
                return req.httpMethod == "PUT"
            case .post:
                return req.httpMethod == "POST"
            case .patch:
                return req.httpMethod == "PATCH"
            case .delete:
                return req.httpMethod == "DELETE"
            }
        }
    }
}

enum StubResponseType {
    case json(Any, status: Int32)
    case success(Any?)
    case failure(Error)
    case image(Data)

    var stubsResponse: HTTPStubsResponse {
        let defaultHeaders = ["Content-Type": "application/json"]

        switch self {
        case let .json(response, statusCode):
            return HTTPStubsResponse(jsonObject: response, statusCode: statusCode, headers: defaultHeaders)
        case let .success(response):
            guard let response = response else {
                return HTTPStubsResponse(data: Data(), statusCode: 200, headers: defaultHeaders)
            }
            return HTTPStubsResponse(jsonObject: response, statusCode: 200, headers: defaultHeaders)
        case let .failure(error):
            return HTTPStubsResponse(error: error)
        case let .image(data):
            return HTTPStubsResponse(data: data, statusCode: 200, headers: nil)
        }
    }
}
