//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Gunja Gurung on 7/12/18.
//  Copyright © 2018 Gunja Gurung. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥅🏒⛳️🎣🥊🥋🎽⛸🥌🛷🎿⛷🤼‍♀️",
        "Animals": "🐶🐱🐵🐭🐹🐰🦊🐻🐼🦁🦄🦉🐸🐙🦓🐆🐅🐊🦈🐋🦀🦐🐠",
        "Faces": "👩👮‍♂️👨‍🎓👩‍🎤👨‍🎤👩‍🏫👨‍🏭👩‍🚀🎅🤶🤴🤦‍♂️🙋‍♂️🙋‍♀️👭👩‍👩‍👧👰👨‍🌾👩🏻‍🍳👨🏻‍🍳🙆🏻‍♀️👸🏼👩🏻‍🌾💁🏼‍♀️"
    ]

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                (segue.destination as? ConcentrationViewController)?.theme = theme
            }
        }
    }


}
