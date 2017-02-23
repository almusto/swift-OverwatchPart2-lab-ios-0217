//
//  Game.swift
//  Overwatch
//
//  Created by Alessandro Musto on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit


struct Game {
  var offensiveCharacters:[Hero] = []
  var defensiveCharacters:[Hero] = []
  var supportCharacters:[Hero] = []
  var tankCharacters:[Hero] = []
  var heroType:HeroType = .offense
  var hero: [Hero] {
    return heroesForType()
  }

  init() {
    createAllHeros()
  }

}

extension Game {
  mutating func createAllHeros() {
    let heroType: [HeroType] = [.offense, .defense, .support, .tank]

    for type in heroType {
      let typeArray = HeroName.heros(with: type)
      for hero in typeArray {
        let newHero = Hero(name: hero)
        switch type {
        case .offense:
          offensiveCharacters.append(newHero)
        case .defense:
          defensiveCharacters.append(newHero)
        case .support:
          supportCharacters.append(newHero)
        case .tank:
          tankCharacters.append(newHero)
        }

      }

    }
  }

  func heroesForType() -> [Hero] {
    switch heroType {
    case .offense:
      return offensiveCharacters
    case .defense:
      return defensiveCharacters
    case .support:
      return supportCharacters
    case .tank:
      return tankCharacters
    }
  }
  
  
}




