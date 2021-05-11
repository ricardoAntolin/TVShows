import Domain

extension TVShow: UIModelRepresentable {
    func asUIModel() -> TVShowUIModel {
        return TVShowUIModel(
            id: id,
            name: name,
            ratingAverage: ratingAverage,
            thumbnailURL: image.medium,
            imageURL: image.original,
            summary: summary
        )
    }
}

extension Array where Element == TVShow {
    func asUIModel() -> [TVShowUIModel] {
        return map { $0.asUIModel() }
    }
}
