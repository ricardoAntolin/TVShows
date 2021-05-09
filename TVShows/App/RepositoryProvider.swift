import Foundation
import NetworkProvider
import Data
import Domain

protocol RepositoryProvider {
    var httpClient: HTTPClientRequestHandling { get }
}

final class RepositoryProviderImp: RepositoryProvider {

    let httpClient: HTTPClientRequestHandling

    init(baseURL: URL) {
        self.httpClient = HTTPClient(baseURL: baseURL)
    }
}
