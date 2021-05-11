import Combine

protocol AnyPubliserMockResponseWrapper {
    associatedtype Model
    associatedtype ErrorModel: Error
    var response: Model { get set }
    var error: ErrorModel? { get set }
}

extension AnyPubliserMockResponseWrapper {
    func wrapResponse() -> AnyPublisher<Model, ErrorModel> {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }

        return Just(response)
            .setFailureType(to: ErrorModel.self)
            .eraseToAnyPublisher()
    }
}
