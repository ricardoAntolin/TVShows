import Domain

extension TVShowDataModel: DomainConvertibleType {
    public func asDomain() -> TVShow {
        return TVShow(
            id: id,
            name: name,
            ratingAverage: ratingAverage,
            image: image.asDomain(),
            summary: summary
        )
    }
}

extension ImageDataModel: DomainConvertibleType {
    public func asDomain() -> Image {
        return Image(medium: medium, original: original)
    }
}

extension Array where Element == TVShowDataModel {
    public func asDomain() -> [TVShow] {
        return map { $0.asDomain() }
    }
}
