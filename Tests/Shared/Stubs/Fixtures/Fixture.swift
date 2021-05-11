import Foundation

protocol Fixture: AnyObject {
    func getFixtureAsDictionary(nameResource: String) -> [String: Any]
    func getFixtureAsCollection(nameResource: String) -> [[String: Any]]
    func getFixtureAsPlainCollection(nameResource: String) -> [Any]
}

extension Fixture {

    func getFixtureAsDictionary(nameResource: String) -> [String: Any] {
        return getJSONObject(data: getJSONData(nameResource: nameResource)) as! [String: Any]
    }

    func getFixtureAsCollection(nameResource: String) -> [[String: Any]] {
        return getJSONObject(data: getJSONData(nameResource: nameResource)) as! [[String: Any]]
    }

    func getFixtureAsPlainCollection(nameResource: String) -> [Any] {
        return getJSONObject(data: getJSONData(nameResource: nameResource)) as! [Any]
    }

    // MARK: - Private

    private func getJSONObject(data: Data) -> Any {
        let jsonResult = try! JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
        )
        return jsonResult
    }

    private func getJSONData(nameResource: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: nameResource, ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)! as Data
        return jsonData
    }
}
