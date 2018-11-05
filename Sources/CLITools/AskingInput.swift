import Foundation

public func askInput(_ inputFunction:((Bool) -> String?) = readLine, for information: String) -> String? {

    print()
    print(information)
    while let input = inputFunction(true) {
        guard input != "exit" else {
            break
        }

        return input
    }
    return nil

}


