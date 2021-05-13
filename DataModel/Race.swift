//
//  Race.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import Foundation

typealias Members = Set<Character>

final class Race {
    
    let name: String
    let description: String
    var _characters: Members
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        _characters = Members()
    }

}

extension Race {

    func add(character: Character) {
        guard character.race == self else { return}
            _characters.insert(character)
        
    }
    
    func add(characters: Character...) {
        characters.forEach {add(character: $0)}
    }

}

extension Race {
    var proxyForEquality: String {
        return "\(name)"
    }
}

extension Race: Hashable {
  func hash(into hasher: inout Hasher) {
     hasher.combine(proxyForEquality)
  }
}

extension Race: Equatable {
    static func == (lhs: Race, rhs: Race) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}
