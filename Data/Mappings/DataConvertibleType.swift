public protocol DataConvertibleType {
    associatedtype DataType

    func asDataEntity() -> DataType
}
