// Created by Prof. H in 2022
// Part of the RepoBrowser project
// Using Swift 5.0
// Qapla'

import XCTest
@testable import RepoBrowser

class RepoParsingTests: XCTestCase {

  let expired: TimeInterval = 10
  var expectation: XCTestExpectation!

  override func setUp() {
    expectation = expectation(description: "Able to parse the repo data received")
  }


  // MARK: - Testing Repository Parsing for Swift

  func test_ParseFirstSwiftRepo() async {

    // Given...
    let swiftParser = Parser(language: "swift")

    // When...
    let repos = await swiftParser.fetchRepositories()
    XCTAssertEqual(repos.first?.name, "awesome-ios")
    XCTAssertEqual(repos.first?.htmlURL, "https://github.com/vsouza/awesome-ios")
    XCTAssertEqual(repos.first?.itemDescription, "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects ")
    self.expectation.fulfill()

    // Wait how long...
    await waitForExpectations(timeout: expired)

  }

  func test_ParseFirstSwiftRepoFails() async {

    let swiftParser = Parser(language: "swift")
    
    let repos = await swiftParser.fetchRepositories()
    XCTAssertNotEqual(repos.first?.name, "alamofire")
    self.expectation.fulfill()

    await waitForExpectations(timeout: expired)
  }

  func test_ParseSwiftReposCounted() async {

    let swiftParser = Parser(language: "swift")

    let repos = await swiftParser.fetchRepositories()
    XCTAssertEqual(repos.count, 30)
    self.expectation.fulfill()

    await waitForExpectations(timeout: expired)
  }

  // MARK: - Testing Repository Parsing for Ruby

  func test_ParseFirstRubyRepo() async {

    // Given...
    let parser = parserFor("ruby")

    // When...
    let repos = await parser.fetchRepositories()
    XCTAssertEqual(repos.first?.name, "rails")
    XCTAssertEqual(repos.first?.htmlURL, "https://github.com/rails/rails")
    self.expectation.fulfill()

    await waitForExpectations(timeout: expired)
  }

  // MARK: - Testing Repository Parsing for Kotlin

  func test_ParseFirstKotlinRepo() async {

    // Given...
    let parser = parserFor("kotlin")

    // When...
    let repos = await parser.fetchRepositories()
    XCTAssertEqual(repos.first?.name, "kotlin")
    XCTAssertEqual(repos.first?.htmlURL, "https://github.com/JetBrains/kotlin")
    self.expectation.fulfill()

    // Wait how long...
    await waitForExpectations(timeout: expired)

  }

  private func parserFor(_ language: String) -> Parser {
    let parser = Parser(language: language)
    return parser
  }


}
