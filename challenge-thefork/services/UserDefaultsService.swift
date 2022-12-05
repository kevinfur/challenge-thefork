//
//  UserDefaultsService.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 05/12/2022.
//

import Foundation

class UserDefaultsService {
    private var settingsContainer: SettingsContainer

    init(settingsContainer: SettingsContainer = UserDefaultsContainer()) {
        self.settingsContainer = settingsContainer
    }

    var favouriteRestaurants: [String] {
        get {
            return settingsContainer.favouriteRestaurants
        }
        set {
            settingsContainer.favouriteRestaurants = newValue
        }
    }
}

protocol SettingsContainer {
    var favouriteRestaurants: [String] { get set }
}

class UserDefaultsContainer: SettingsContainer {
    private struct Keys {
        static let favouriteRestaurants = "favourite-restaurants"
    }
    
    var favouriteRestaurants: [String] {
        get {
            return UserDefaults.standard.object(forKey: Keys.favouriteRestaurants) as? [String] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.favouriteRestaurants)
        }
    }
}
