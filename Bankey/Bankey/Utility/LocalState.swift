//
//  LocalState.swift
//  Bankey
//
//  Created by Micaella Morales on 3/24/22.
//

import Foundation

struct LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
}
