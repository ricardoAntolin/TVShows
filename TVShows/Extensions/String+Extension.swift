extension String {
    func extractHTMLTags() -> String {
        return replacingOccurrences(
            of: "<[^>]+>",
            with: "",
            options: .regularExpression,
            range: nil
        )
    }
}
