import Foundation

struct TVShowUIModel: Identifiable, Equatable {
    public let id: Int
    public let name: String
    public let ratingAverage: Double
    public let thumbnailURL: URL
    public let imageURL: URL
    public let summary: String
}
