//
//  SeasonTest.swift
//  TheDarkCrystalTests
//
//  Created by Maria on 16/11/2020.
//

import XCTest
@testable import TheDarkCrystal

class StoryTest: XCTestCase {
    
    struct SetDate {
        
        func stringToDate (for date:String) -> Date {
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
    
    var serie: Story!
    var movie: Story!
    
    override func setUpWithError() throws {
        let date = SetDate()
        let movieDate = date.stringToDate(for: "1982-12-13")
        let seriesDate = date.stringToDate(for: "2019-08-30")
        
        movie = Story(name: "The Dark Crystal", plot: PLOT_MOVIE, type: TYPE_OF_STORY.film, releaseDate:  movieDate, image: UIImage(named: "dark-cristal-movie.jpg")! )
        serie = Story(name: "The Dark Crystal: Age of Resistance ", plot: PLOT_SERIES, type: TYPE_OF_STORY.serie, releaseDate: seriesDate ,  image: UIImage(named: "dark-cristal-series.jpg")!)
        
        let episode1 = Episode(name: "End. Begin. All the Same", number: 1, story: serie )
        let episode2 = Episode(name: "Nothing Is Simple Anymore", number: 2, story: serie )
        let episode3 = Episode(name: "What Was Sundered and Undone", number: 3, story: serie )
        let episode4 = Episode(name: "The First Thing I Remember Is Fire", number: 4, story: serie )
        let episode5 = Episode(name: "She Knows All the Secrets", number: 5, story: serie )
        let episode6 = Episode(name: "By Gelfling Hand...", number: 6, story: serie )
        let episode7 = Episode(name: "Time to Make...My Move.", number: 7, story: serie )
        let episode8 = Episode(name: "Prophets Don't Know Everything", number: 8, story: serie)
        let episode9 = Episode(name: "The Crystal Calls", number: 9, story: serie)
        let episode10 = Episode(name: "A Single Piece Was Lost", number:10, story: serie )
        
        let arrayEpisodes = [episode1,episode2,episode1,episode3,episode4,episode5,episode6,episode7, episode8, episode9, episode10]
        
        serie.add(episodes: arrayEpisodes)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHouseExistence() {
        XCTAssertNotNil(serie)
    }
    
    func testStory()  {
        XCTAssertEqual(serie, serie)
        XCTAssertNotEqual(serie, movie)
        
    }
    
    func testStoryAddEpisodes() {
        XCTAssertEqual(serie._episodes.count, 10)
    }
    
    func testSortedByNumber()  {
        XCTAssertEqual(serie.sortedEpisodes, serie.sortedEpisodes.sorted())
        print(serie.sortedEpisodes)
        
    }
    
}
