//  File.swift
//  Mjolnir
//
//  Copyright (c) 2018 ___ORGANIZATIONNAME___. All rights reserved.

import XCTest
@testable import CLITools

class URLBuilderTests: XCTestCase {


    func testUrlBuilderForGitFormat() {

        let urlForGitlab = String.gitUrl(from: "https://gitlab.com/username/swiftcli.git")
        XCTAssert(urlForGitlab == "git@gitlab.com:username/swiftcli.git")

        let urlForGithub = String.gitUrl(from: "https://github.com/react-native-helpers/Specs.git")
        XCTAssert(urlForGithub == "git@github.com:react-native-helpers/Specs.git")

        let urlForGithubWithoutHTTPS = String.gitUrl(from: "http://github.com/react-native-helpers/Specs.git")
        XCTAssert(urlForGithubWithoutHTTPS == "git@github.com:react-native-helpers/Specs.git")

        let urlForGithubNoChange = String.gitUrl(from: "git@github.com:react-native-helpers/Specs.git")
        XCTAssert(urlForGithubNoChange == "git@github.com:react-native-helpers/Specs.git")

    }


    func testUrlBuilderForHttpFormat() {

        let urlForGitlab = String.gitUrl(from: "git@gitlab.com:username/swiftcli.git", using: .http)
        XCTAssert(urlForGitlab == "https://gitlab.com/username/swiftcli.git", urlForGitlab)

        let urlForGithub = String.gitUrl(from: "git@github.com:react-native-helpers/Specs.git", using: .http)
        XCTAssert(urlForGithub == "https://github.com/react-native-helpers/Specs.git")

        let urlForGithubNoChange = String.gitUrl(from: "https://github.com/react-native-helpers/Specs.git", using: .http)
        XCTAssert(urlForGithubNoChange == "https://github.com/react-native-helpers/Specs.git")

    }

}

