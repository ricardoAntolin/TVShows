import Foundation

public struct TVShow: Equatable {
    public let id: Int
    public let name: String
    public let ratingAverage: Double
    public let image: Image
    public let summary: String

    public init(
        id: Int,
        name: String,
        ratingAverage: Double,
        image: Image,
        summary: String
    ) {
        self.id = id
        self.name = name
        self.ratingAverage = ratingAverage
        self.image = image
        self.summary = summary
    }
}

public struct Image: Equatable {
    public let medium: URL
    public let original: URL

    public init(medium: URL, original: URL) {
        self.medium = medium
        self.original = original
    }
}
