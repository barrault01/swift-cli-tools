import Foundation

public struct FileReaderAndWriter {

    private let fileManager: FileManager
    private let folderURL: URL
    private let override: Bool

    public init(fileManager: FileManager = FileManager.default,
         folderURL: URL? = nil,
         override: Bool = false) {
        self.fileManager = fileManager
        if let url = folderURL {
            self.folderURL = url
        } else {
            self.folderURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        }
        self.override = override
    }

    public func write(_ files: [File]) -> [Bool] {
        return files.map(write)
    }

    public func read(at path: String) -> String? {
        let newFile = folderURL.appendingPathComponent(path).path
        guard fileManager.isReadableFile(atPath: newFile), let data = fileManager.contents(atPath: newFile) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    public func write(_ file: File) -> Bool {
        let newFile = folderURL.appendingPathComponent(file.name).path
        if fileManager.fileExists(atPath:newFile) && !override {
            return false
        }else{
            let data = file.content.data(using: .utf8)
            return fileManager.createFile(atPath: newFile, contents: data, attributes: nil)
        }
    }

    public func createFolder(named: String) -> Bool {
        let folder = folderURL.appendingPathComponent(named).path
        do {
            try fileManager.createDirectory(atPath: folder,
                                            withIntermediateDirectories: true,
                                            attributes: nil)
            return true
        }
        catch {
            print(error)
            return false
        }
    }

    static public func prettierLogForFile(success: [Bool]) -> String {
        return "You just created \(success.filter({$0 == true}).count) arquives."
    }

    static public func prettierLogForFolder(success: [Bool]) -> String {
        return "You just created \(success.filter({$0 == true}).count) folders."
    }


}
