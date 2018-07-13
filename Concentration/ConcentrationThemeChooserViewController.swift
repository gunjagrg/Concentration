//
//  Stanford - Developing iOS 11 Apps with Swift - 7. Multiple MVCs, Timer, and Animation
//
//  ConcentrationThemeChooserViewController.swift
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥅🏒⛳️🎣🥊🥋🎽⛸🥌🛷🎿⛷🤼‍♀️",
        "Animals": "🐶🐱🐵🐭🐹🐰🦊🐻🐼🦁🦄🦉🐸🐙🦓🐆🐅🐊🦈🐋🦀🦐🐠",
        "Faces": "👩👮‍♂️👨‍🎓👩‍🎤👨‍🎤👩‍🏫👨‍🏭👩‍🚀🎅🤶🤴🤦‍♂️🙋‍♂️🙋‍♀️👭👩‍👩‍👧👰👨‍🌾👩🏻‍🍳👨🏻‍🍳🙆🏻‍♀️👸🏼👩🏻‍🌾💁🏼‍♀️"
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
//    override func viewDidLoad() {
//        splitViewController?.delegate = self
//    }
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
        
    }


    
    // MARK: - Navigation
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme", let themeName = (sender as? UIButton)?.currentTitle,
            let theme = themes[themeName], let cvc = segue.destination as? ConcentrationViewController {
            cvc.theme = theme
            lastSeguedToConcentrationViewController = cvc
        }
    }


}
