//
//  SettingsService.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 05/12/2022.
//

import Foundation

class FavouriteRestaurantsService {
    private var userDefaultsService: UserDefaultsService

    init(userDefaultsService: UserDefaultsService = UserDefaultsService()) {
        self.userDefaultsService = userDefaultsService
    }
    
    func addRestaurant(id: String) {
        userDefaultsService.favouriteRestaurants.append(id)
    }
    
    func removeRestaurant(id: String) {
        userDefaultsService.favouriteRestaurants = userDefaultsService.favouriteRestaurants.filter({ $0 == id })
    }
    
    func hasRestaurant(withId id: String) -> Bool {
        return userDefaultsService.favouriteRestaurants.filter({ $0 == id }).count > 0
    }
    
    func toggleRestaurant(id: String) {
        if hasRestaurant(withId: id) {
            removeRestaurant(id: id)
        } else {
            addRestaurant(id: id)
        }
    }
}
