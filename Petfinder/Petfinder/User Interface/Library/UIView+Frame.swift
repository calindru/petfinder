//
//  UIView+Frame.swift
//  Petfinder
//
//  Created by Calin Drule on 10.10.2022.
//

import UIKit

extension UIView {
    var top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        frame.origin.y + frame.height
    }
    
    var left: CGFloat {
        frame.origin.x
    }
    
    var right: CGFloat {
        frame.origin.x + frame.width
    }
}
