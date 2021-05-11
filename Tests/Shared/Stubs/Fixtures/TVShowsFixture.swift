import Foundation

final class TVShowsFixture: Fixture {

    func getTVShowsFixture() -> [[String: Any]] {
        return getFixtureAsCollection(nameResource: "GET_shows")
    }
}
