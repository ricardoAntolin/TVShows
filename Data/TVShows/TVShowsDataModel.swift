import Foundation

public struct TVShowDataModel: Equatable {
    public let id: Int
    public let name: String
    public let ratingAverage: Double
    public let image: ImageDataModel
    public let summary: String

    public init(
        id: Int,
        name: String,
        ratingAverage: Double,
        image: ImageDataModel,
        summary: String
    ) {
        self.id = id
        self.name = name
        self.ratingAverage = ratingAverage
        self.image = image
        self.summary = summary
    }
}

public struct ImageDataModel: Equatable {
    public let medium: URL
    public let original: URL

    public init(medium: URL, original: URL) {
        self.medium = medium
        self.original = original
    }
}
