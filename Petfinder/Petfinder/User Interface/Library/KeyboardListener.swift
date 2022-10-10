//
//  KeyboardListener.swift
//  Petfinder
//
//  Created by Calin Drule on 10.10.2022.
//

import Foundation
import UIKit

protocol KeyboardListener: AnyObject {
    func startListeningKeyboardEvents()
    func stopListeningKeyboardEvents()
    
    func keyboardWillBeShown(info: KeyboardInfo)
    func keyboardWillBeHidden(info: KeyboardInfo)
}

struct KeyboardInfo {
    let beginFrame: CGRect
    let endFrame: CGRect
    let curve: UIView.AnimationCurve
    let duration: TimeInterval
    let isLocal: Bool
    
    init(notification: Notification) {
            let userInfo = notification.userInfo
        beginFrame = userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect ?? .zero
        endFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        curve = UIView.AnimationCurve(rawValue: userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int ?? 0)!
        duration = userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
        isLocal = userInfo?[UIResponder.keyboardIsLocalUserInfoKey] as? Bool ?? false
        }
}

extension KeyboardListener {
    func startListeningKeyboardEvents() {
        let center = NotificationCenter.default
        
        center.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { [weak self] notification in
            self?.keyboardWillBeShown(info: KeyboardInfo(notification: notification))
        }
        
        center.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main) { [weak self] notification in
            self?.keyboardWillBeHidden(info: KeyboardInfo(notification: notification))
        }
    }
    
    func stopListeningKeyboardEvents() {
        let center = NotificationCenter.default
        center.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
