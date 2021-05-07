import Foundation
import NetworkProvider
import Data
import Domain

final class RepositoryProvider {

    private let httpClient: HTTPClient

    init(baseURL: URL) {
        self.httpClient = HTTPClient(baseURL: baseURL)
    }
}
