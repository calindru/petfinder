//
//  PetSearchViewController.swift
//  Petfinder
//
//  Created by Calin Drule on 06.10.2022.
//

import UIKit

class PetSearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startListeningKeyboardEvents()
        originalSearchBarPosition = searchBarBottomConstraint.constant
    }

    deinit {
        stopListeningKeyboardEvents()
    }
    
    // MARK: - Private
    
    private var originalSearchBarPosition: CGFloat = 0
}

extension PetSearchViewController: KeyboardListener {
    func keyboardWillBeShown(info: KeyboardInfo) {
        drawKeyboard(visible: true, info: info)
    }
    
    func keyboardWillBeHidden(info: KeyboardInfo) {
        drawKeyboard(visible: false, info: info)
    }
    
    private func drawKeyboard(visible: Bool, info: KeyboardInfo) {
        let searchBarBottom = visible ? -info.endFrame.height : originalSearchBarPosition
        
        UIView.animate(withDuration: info.duration, delay: 0, options: UIView.AnimationOptions(rawValue: UInt(info.curve.rawValue))) {
            self.searchBarBottomConstraint.constant = searchBarBottom
            self.view.layoutIfNeeded()
        }
    }
}

extension PetSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
