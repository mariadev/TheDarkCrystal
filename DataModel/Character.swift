//
//  Character.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import UIKit

final class Character {
    
    let race: Race
    let name: String
    let image: UIImage
    let description: String
    let appearOn: String
    let aphorism: String
    
    init(name: String, race: Race, image: UIImage, description: String, appearOn: String, aphorism: String) {
        self.name = name
        self.race = race
        self.image = image
        self.description = description
        self.appearOn = appearOn
        self.aphorism = aphorism

    }
    
}

extension Character {
    var proxyForEquality: String {
        return "\(name) \(race.name)"
    }
    
    var proxyForComparison: String {
        return name
    }
}
extension Character: Hashable {
  func hash(into hasher: inout Hasher) {
     hasher.combine(proxyForEquality)
  }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Character: Comparable {
    static func < (lhs: Character, rhs: Character) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
