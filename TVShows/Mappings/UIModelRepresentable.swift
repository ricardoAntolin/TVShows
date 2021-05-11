protocol UIModelRepresentable {
    associatedtype UIModelType

    func asUIModel() -> UIModelType
}
