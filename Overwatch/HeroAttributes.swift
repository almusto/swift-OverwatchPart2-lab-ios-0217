//
//  HeroAttributes.swift
//  Overwatch
//
//  Created by Alessandro Musto on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation


enum HeroName: CustomStringConvertible {
  var description: String {
    switch self {
    case .genji:
      return "Genji"
    case .mcCree:
      return "McCree"
    case .pharah:
      return "Pharah"
    case .reaper:
      return "Reaper"
    case .soldier76:
      return "Soldier 76"
    case .tracer:
      return "Tracer"
    case .bastion:
      return "Bastion"
    case .hanzo:
      return "Hanzo"
    case .junkrat:
      return "Junkrat"
    case .mei:
      return "Mei"
    case .torbjörn:
      return "Torbjörn"
    case .widowmaker:
      return "Widowmaker"
    case .dva:
      return "Dva"
    case .reinhardt:
      return "Reinhardt"
    case .roadhog:
      return "Roadhog"
    case .winston:
      return "Winston"
    case .zarya:
      return "Zarya"
    case .ana:
      return "Ana"
    case .lúcio:
      return "Lúcio"
    case .mercy:
      return "Mercy"
    case .symmetra:
      return "Symmetra"
    case .zenyatta:
      return "Zenyatta"
    }
  }

  static func heros(with type: HeroType) -> [HeroName] {
    switch type {
    case .offense:
      return [.genji, .mcCree, .pharah, .reaper, .soldier76, .tracer]
    case .defense:
      return [.bastion, .hanzo, .junkrat, .mei, .torbjörn, .widowmaker]
    case .tank:
      return [.dva, .reinhardt, .roadhog, .winston, .zarya]
    case .support:
      return [.ana, .lúcio, .mercy, .symmetra, .zenyatta]
    }
  }


  case genji, mcCree, pharah, reaper, soldier76, tracer, bastion, hanzo, junkrat, mei, torbjörn, widowmaker, dva, reinhardt, roadhog, winston, zarya, ana, lúcio, mercy, symmetra, zenyatta


}

  enum HeroType: CustomStringConvertible {

  var description: String {
    switch self {
    case .offense:
      return "Offense: 💥"
    case .defense:
      return "Defense: 🛡"
    case .support:
      return "Support: 🚑"
    case .tank:
      return "Tank: 🐼"
    }
  }

  static var allTypes: [HeroType] = [.offense, .defense, .tank, .support]
  case offense, defense, support, tank
}








