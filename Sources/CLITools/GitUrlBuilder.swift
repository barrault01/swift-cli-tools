import Foundation

public enum GitURLFormat {
    case http
    case git
}

public extension String {

    func isMatching(regex: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: regex, options: .caseInsensitive)
        guard let match =  regex?.firstMatch(in: self, range: NSRange(location: 0, length: self.count)) else {
            return false
        }
        return (match.range.length > 0)
    }


    public static func gitUrl(from: String, using format: GitURLFormat = .git) -> String  {
        switch format {
        case .git: return from.applyGitURLFormat()
        case .http: return from.applyHttpURLFormat()
        }
    }
    private func isGitFormat() -> Bool {
        return self.isMatching(regex: "git@.+:.+.git")
    }

    private func isUrlFormat() -> Bool {
        return self.isMatching(regex: "https://.+/.+.git")
    }

    private func applyGitURLFormat() -> String {
        if isGitFormat() {
            return self
        }
        var copy = self.replacingOccurrences(of: "https://", with: "git@")
        copy = copy.replacingOccurrences(of: "http://", with: "git@")
        if let range = copy.range(of: "/") {
            copy = copy.replacingCharacters(in: range, with: ":")
        }
        return copy
    }

    private func applyHttpURLFormat() -> String {
        if isUrlFormat() {
            return self
        }
        var copy = self
        if let range = copy.range(of: ":") {
            copy = copy.replacingCharacters(in: range, with: "/")
        }
         copy = copy.replacingOccurrences(of: "git@", with: "https://")

        return copy
    }

}
