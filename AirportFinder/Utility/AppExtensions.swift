//
//  AppExtensions.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import Foundation
import UIKit


extension UITextField {
    
    func setLeftPadding(padding:CGFloat) {
        let paddingView = UIView (frame: CGRect(x:0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    
    }
    func setRightPadding(padding:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y:0, width:padding, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
}

extension Array {

    func uniques<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return reduce([]) { result, element in
            let alreadyExists = (result.contains(where: { $0[keyPath: keyPath] == element[keyPath: keyPath] }))
            return alreadyExists ? result : result + [element]
        }
    }
}

