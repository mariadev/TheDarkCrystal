//
//  EpisodeTest.swift
//  TheDarkCrystalTests
//
//  Created by Maria on 16/11/2020.
//

import XCTest
@testable import TheDarkCrystal

class EpisodeTest: XCTestCase {
    
    var episode1: Episode!
    var episode2: Episode!
    var serie: Story!
    
    override func setUpWithError() throws {
        
        struct SetDate {
            
            func stringToDate (for date: String) -> Date {
                let stringDate = date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let getDate = dateFormatter.date(from: stringDate)
                guard let releaseDate = getDate
                else {
                    fatalError()
                }
                return releaseDate
            }
        }
        
        let date = SetDate()
        
        let movieDate = date.stringToDate(for: "1982-12-13")
        let seriesDate = date.stringToDate(for: "2019-08-30")
        
        _ = Story(name: "The Dark Crystal", plot: PLOT_MOVIE, type: TYPE_OF_STORY.film, releaseDate: movieDate, image: UIImage(named: "dark-cristal-movie.jpg")! )
        serie = Story(name: "The Dark Crystal: Age of Resistance ", plot: PLOT_SERIES, type: TYPE_OF_STORY.serie, releaseDate: seriesDate, image: UIImage(named: "dark-cristal-series.jpg")!)
        
        episode1 = Episode(name: "End. Begin. All the Same",
                           number: 1,
                           story: serie )
        episode2 = Episode(name: "Nothing Is Simple Anymore", number: 2, story: serie )
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1)
    }
    
    func testEpisode() {
        XCTAssertEqual(episode1, episode1)
        
        let episode0 = Episode(name: "End. Begin. All the Same",
                               number: 1,
                               story: serie )
        
        XCTAssertEqual(episode1, episode0)
        
        XCTAssertNotEqual(episode1, episode2)
        
    }
    
}
