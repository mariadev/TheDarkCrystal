//
//  RepositoryStory.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import UIKit

final class RepositoryStory {
    static let local = LocalFactoryStory()
}

protocol RepositoryStoryFactory {
    var stories: [Story] {get}
}


final class LocalFactoryStory: RepositoryStoryFactory {
    
    var stories: [Story] {
        
        let date = SetDate()
        let movieDate = date.stringToDate(for: "1982-12-13")
        let seriesDate = date.stringToDate(for: "2019-08-30")
        
        let movie = Story(name: "The Dark Crystal", plot: PLOT_MOVIE, type: TYPE_OF_STORY.film, releaseDate:  movieDate, image: UIImage(named: "dark-cristal-movie.jpg")! )
        let serie = Story(name: "The Dark Crystal: Age of Resistance", plot: PLOT_SERIES, type: TYPE_OF_STORY.serie, releaseDate: seriesDate ,  image: UIImage(named: "dark-cristal-series.jpg")!)
        
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
        
        let arrayEpisodes = [episode6,episode7, episode8, episode9, episode10,episode1,episode2,episode1,episode3,episode4,episode5]
        
        serie.add(episodes: arrayEpisodes)
        print(serie.sortedEpisodes)
        
        return [serie, movie].sorted()
    }
    
    func storiesFilter(named name: String) -> Story? {
        let story = stories.first{ $0.name.uppercased() == name.uppercased()}
        return story
    }
    
    
}

  
