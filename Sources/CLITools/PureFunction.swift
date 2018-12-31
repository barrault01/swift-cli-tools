public func printAsFunction(string: String) {
    print(string)
}

public func printAsFunction(string: String?) {
    if let str = string {
        printAsFunction(string: str)
    }
}
