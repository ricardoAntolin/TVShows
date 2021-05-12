import Foundation
import Data
import Domain
import NetworkProvider

@testable import TVShows

struct TVShowMother {
    // swiftlint:disable line_length
    static let defaultId: Int = 1
    static let defaultName: String = "Under the Dome"
    static let defaultRatingAverage: Double = 6.6
    static let defaultThumbnailURL: URL = URL(string: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")!
    static let defaultImageURL: URL = URL(string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")!
    static let defaultSummary: String = "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>"
    // swiftlint:enable line_length

    static func uiModel(
        id: Int = defaultId,
        name: String = defaultName,
        ratingAverage: Double = defaultRatingAverage,
        thumbnailURL: URL = defaultThumbnailURL,
        imageURL: URL = defaultImageURL,
        summary: String = defaultSummary
    ) -> TVShowUIModel {
        return TVShowUIModel(
            id: id,
            name: name,
            ratingAverage: ratingAverage,
            thumbnailURL: thumbnailURL,
            imageURL: imageURL,
            summary: summary
        )
    }

    static func domainModel(
        id: Int = defaultId,
        name: String = defaultName,
        ratingAverage: Double = defaultRatingAverage,
        thumbnailURL: URL = defaultThumbnailURL,
        imageURL: URL = defaultImageURL,
        summary: String = defaultSummary
    ) -> TVShow {
        return TVShow(
            id: id,
            name: name,
            ratingAverage: ratingAverage,
            image: Image(medium: thumbnailURL, original: imageURL),
            summary: summary
        )
    }

    static func dataModel(
        id: Int = defaultId,
        name: String = defaultName,
        ratingAverage: Double = defaultRatingAverage,
        thumbnailURL: URL = defaultThumbnailURL,
        imageURL: URL = defaultImageURL,
        summary: String = defaultSummary
    ) -> TVShowDataModel {
        return TVShowDataModel(
            id: id,
            name: name,
            ratingAverage: ratingAverage,
            image: ImageDataModel(medium: thumbnailURL, original: imageURL),
            summary: summary
        )
    }

    static func apiModel(
        id: Int = defaultId,
        name: String = defaultName,
        ratingAverage: Double = defaultRatingAverage,
        thumbnailURL: URL = defaultThumbnailURL,
        imageURL: URL = defaultImageURL,
        summary: String = defaultSummary
    ) -> TVShowAPIModel {
        return TVShowAPIModel(
            id: id,
            name: name,
            rating: RatingAPIModel(average: ratingAverage),
            image: ImageAPIModel(medium: thumbnailURL, original: imageURL),
            summary: summary
        )
    }
}
