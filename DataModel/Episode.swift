//
//  Episode.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import Foundation


final class Episode {
    
    let name: String
    let number: Int
   weak var story : Story?
    
    init(name: String, number: Int, story: Story) {
        self.name = name
        self.number = number
        self.story = story
    }
    
}


extension  Episode {
    var proxyForEquality: String {
        return "\(name)"
    }
    
    var proxyForComparison: Int {
        return number
    }
}
extension Episode: Hashable {
  func hash(into hasher: inout Hasher) {
     hasher.combine(proxyForEquality)
  }
}

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
