import Foundation
import NetworkProvider
import Data
import Domain

protocol RepositoryProvider {
    var httpClient: HTTPClient { get }
}

final class RepositoryProviderImp: RepositoryProvider {

    let httpClient: HTTPClient

    init(baseURL: URL) {
        self.httpClient = HTTPClient(baseURL: baseURL)
    }
}
