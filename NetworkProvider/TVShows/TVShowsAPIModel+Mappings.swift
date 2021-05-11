import Data

extension TVShowAPIModel: DataConvertibleType {
    public func asDataEntity() -> TVShowDataModel {
        return TVShowDataModel(
            id: id,
            name: name,
            ratingAverage: rating.average,
            image: image.asDataEntity(),
            summary: summary
        )
    }
}

extension ImageAPIModel: DataConvertibleType {
    public func asDataEntity() -> ImageDataModel {
        return ImageDataModel(
            medium: medium,
            original: original
        )
    }
}

extension Array where Element == TVShowAPIModel {
    func asDataEntity() -> [TVShowDataModel] {
        return map { $0.asDataEntity() }
    }
}
