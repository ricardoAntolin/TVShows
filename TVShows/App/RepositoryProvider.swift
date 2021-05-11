import Foundation
import NetworkProvider
import Data
import Domain

protocol RepositoryProvider {
    var httpClient: HTTPClientRequestHandling { get }
    var tvShowsRepository: TVShowsRepository { get }
}

final class RepositoryProviderImp: RepositoryProvider {

    let httpClient: HTTPClientRequestHandling

    private lazy var tvShowsNetworkProvider: TVShowsProvider = {
        return TVShowsNetworkProvider(
            tvShowsAPI: TVShowsAPI(httpClient: httpClient)
        )
    }()

    lazy var tvShowsRepository: TVShowsRepository = {
       return TVShowsDataRepository(networkProvider: tvShowsNetworkProvider)
    }()

    init(baseURL: URL) {
        self.httpClient = HTTPClient(baseURL: baseURL)
    }
}
