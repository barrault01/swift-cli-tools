public protocol EnumFile {
    associatedtype FileType: EnumFile
    func file(moduleInformation: (projectName: String, module: String, path: String)) -> File
    func fileName(path: String, projectName: String) -> String
    func contentFor(projectName: String, exportModule: String) -> String
    static func allFiles(moduleInformation: (String, String, String)) -> [File]
    static func all() -> [FileType]
}

extension EnumFile {

    public func file(moduleInformation: (projectName: String, module: String, path: String)) -> File {
        let name = fileName(path: moduleInformation.path, projectName: moduleInformation.projectName)
        let content = contentFor(projectName: moduleInformation.projectName, exportModule: moduleInformation.module)
        return File(name: name, content: content)
    }

    public static func allFiles(moduleInformation: (String, String, String)) -> [File] {
        return all().map({$0.file(moduleInformation: moduleInformation)})
    }

}
