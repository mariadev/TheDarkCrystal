//
//  UIViewController+Navigation.swift
//  TheDarkCrystal
//
//  Created by Maria on 19/11/2020.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
