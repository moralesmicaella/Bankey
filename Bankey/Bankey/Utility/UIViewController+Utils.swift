//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Micaella Morales on 3/24/22.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        // TODO
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
