import Foundation

public struct TVShowAPIModel: Codable, Equatable {
    public let id: Int
    public let name: String
    public let rating: RatingAPIModel
    public let image: ImageAPIModel
    public let summary: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case image
        case summary
    }

    public init(
        id: Int,
        name: String,
        rating: RatingAPIModel,
        image: ImageAPIModel,
        summary: String
    ) {
        self.id = id
        self.name = name
        self.rating = rating
        self.image = image
        self.summary = summary
    }
}

public struct ImageAPIModel: Codable, Equatable {
    public let medium: URL
    public let original: URL

    enum CodingKeys: String, CodingKey {
        case medium
        case original
    }

    public init(medium: URL, original: URL) {
        self.medium = medium
        self.original = original
    }
}

public struct RatingAPIModel: Codable, Equatable {
    public let average: Double

    enum CodingKeys: String, CodingKey {
        case average
    }

    public init(average: Double) {
        self.average = average
    }
}
