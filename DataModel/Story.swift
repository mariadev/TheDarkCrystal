//
//  Story.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import UIKit

typealias Episodes = Set<Episode>

final class Story {
    let name: String
    let plot: String
    let type: String
    let releaseDate: Date
    let image: UIImage
    var _episodes: Episodes
    
    init(name: String, plot: String, type: String, releaseDate: Date, image: UIImage) {
        self.name = name
        self.plot = plot
        self.type = type
        self.releaseDate = releaseDate
        self.image = image
        _episodes = Episodes()
    }
}

extension Story {
    var proxyForEquality: String {
        return "\(type)"
    }
    
    var proxyForComparison: Date {
        return releaseDate
    }
}

extension Story {
    
    var count: Int {
        return _episodes.count
    }
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }

    func add(episodes: [Episode]) {
        episodes.forEach { episode in
            guard episode.story == self else { return}
            _episodes.insert(episode)
        }
        
    }

}

extension Story: Hashable {
  func hash(into hasher: inout Hasher) {
     hasher.combine(proxyForEquality)
  }
}

extension Story: Equatable {
    static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Story: Comparable {
    static func < (lhs: Story, rhs: Story) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
