//
//  AppAppearance.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 9/1/22.
//

import Foundation
import UIKit

final class AppAppearance {

    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

extension UINavigationController {
    @objc override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
