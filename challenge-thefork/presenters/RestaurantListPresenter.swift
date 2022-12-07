//
//  RestaurantListPresenter.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import Foundation

protocol RestaurantListPresenterProtocol: AnyObject {
    var view: RestaurantListViewProtocol? { get set }
    var restaurants: [MinifiedRestaurant] { get }
    func didLoad()
    func fetchRestaurants()
    func didTapHeart(_ restaurantId: String)
    func didTapSortByName()
    func didTapSortByRating()
}

class RestaurantListPresenter: RestaurantListPresenterProtocol {
    
    weak var view: RestaurantListViewProtocol?
    var favouriteRestaurantsService: FavouriteRestaurantsService
    var restaurantsService: RestaurantsServiceProtocol
    
    init(restaurantsService: RestaurantsServiceProtocol = RestaurantsService.shared, favouriteRestaurantsService: FavouriteRestaurantsService = FavouriteRestaurantsService()) {
        self.restaurantsService = restaurantsService
        self.favouriteRestaurantsService = favouriteRestaurantsService
    }
    
    var restaurants: [MinifiedRestaurant] = [] {
        didSet {
            view?.updateUI()
        }
    }
    
    func didLoad() {
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        view?.showSpinner()
        restaurantsService.getRestaurants(completion: { result in
            self.view?.hideSpinner()
            switch result {
            case .success(let response):
                self.restaurants = response.data?.compactMap({ MinifiedRestaurantMapper.map(from: $0, favouriteRestaurantsService: self.favouriteRestaurantsService) }) ?? []
            case .failure(let error):
                self.view?.showFetchError()
            }
        })
    }
    
    func didTapHeart(_ restaurantId: String) {
        if let index = self.restaurants.firstIndex(where: {$0.uuid == restaurantId}) {
            favouriteRestaurantsService.toggleRestaurant(id: restaurantId)
            restaurants[index].toggleFavourite()
        }
    }
    
    func didTapSortByName() {
        restaurants.sort(by: { (firstRestaurant, secondRestaurant) -> Bool in
            return firstRestaurant.name < secondRestaurant.name
        })
    }
    
    func didTapSortByRating() {
        restaurants.sort(by: { (firstRestaurant, secondRestaurant) -> Bool in
            return firstRestaurant.theForkRatingValue > secondRestaurant.theForkRatingValue
        })
    }
    
}
