//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Alessandro Musto on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
  @IBOutlet weak var characterStackView: UIStackView!
  @IBOutlet weak var heroScrollView: UIScrollView!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var heroNameLabel: UILabel!

  @IBOutlet weak var segButton: UISegmentedControl!
  var game: Game = Game()

  var heros: [Hero] = []
  var heroNames: [String] = []


  var heroType: HeroType! {
    didSet {
      game.heroType = heroType
      updateStackViewWithHeros()

    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      heroScrollView.delegate = self
      heroNameLabel.text = "Genji"

    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    heroType = .offense
  }


  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
  @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      return heroType = .offense
    case 1:
      return heroType = .defense
    case 2:
      return heroType = .tank
    case 3:
      return heroType = .support
    default:
      return heroType = .offense
    }
  }

  func updateStackViewWithHeros() {

    switch segButton.selectedSegmentIndex {
    case 0:
      for view in characterStackView.arrangedSubviews {
        view.removeFromSuperview()
      }
      heros =  game.offensiveCharacters
    case 1:
      for view in characterStackView.arrangedSubviews {
        view.removeFromSuperview()
      }
      heros =  game.defensiveCharacters
    case 3:
      for view in characterStackView.arrangedSubviews {
        view.removeFromSuperview()
      }
      heros =  game.supportCharacters
    case 2:
      for view in characterStackView.arrangedSubviews {
        view.removeFromSuperview()
      }
      heros =  game.tankCharacters
    default:
      print("nope")
  }

    let width = self.heroScrollView.frame.width

    for char in heros {
      let imageView = UIImageView(image: char.profileImage)
      imageView.contentMode = UIViewContentMode.scaleAspectFit
      let name = char.name.description
      heroNames.append(name)
      characterStackView.addArrangedSubview(imageView)
    }

    characterStackViewWidthConstraint.constant = CGFloat(heros.count) * width
  }


  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    updateNameLabel()
  }

  func updateNameLabel() {
    let placeInScrollView = Int(heroScrollView.contentOffset.x / heroScrollView.frame.size.width)
    let hero = heros[placeInScrollView]
    heroNameLabel.text = hero.name.description
  }



}
