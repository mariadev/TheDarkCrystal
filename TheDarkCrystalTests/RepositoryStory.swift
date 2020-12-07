//
//  RepositorySerieTest.swift
//  TheDarkCrystalTests
//
//  Created by Maria on 16/11/2020.
//

import XCTest
@testable import TheDarkCrystal

class RepositoryStoryTest: XCTestCase {
    
    var stories: [Story]!
    
    override func setUpWithError() throws {
        stories = RepositoryStory.local.stories
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLocalRepositoryStoryExistence() {
        XCTAssertNotNil(RepositoryStory.local)
    }
    
    func testLocalRepositoryStoriesExistence() {
        XCTAssertNotNil(stories)
    }
    
    func testLocalRespository_HouseCount() {
        XCTAssertEqual(stories.count, 2)
    }
    
    func testLocalRespositoryReturnStoryByNameCaseInsemsitive () {
        let serie = RepositoryStory.local.storiesFilter(named: "The Dark Crystal: age of Resistance")
        XCTAssertNotNil(serie)
        XCTAssertEqual(serie?.name, NAMES_STORY.serie)
    }
}
