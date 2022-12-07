//
//  RestaurantListPresenter.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import Foundation

protocol RestaurantListPresenterProtocol: AnyObject {
    var view: RestaurantListViewProtocol? { get set }
    var viewModel: [MinifiedRestaurant] { get }
    func didLoad()
    func didTapHeart(_ restaurantId: String)
    func didTapSortByName()
    func didTapSortByRating()
    func didTapRetry()
}

class RestaurantListPresenter: RestaurantListPresenterProtocol {
    
    weak var view: RestaurantListViewProtocol?
    var favouriteRestaurantsService: FavouriteRestaurantsService
    var restaurantsService: RestaurantsServiceProtocol
    
    init(restaurantsService: RestaurantsServiceProtocol = RestaurantsService.shared, favouriteRestaurantsService: FavouriteRestaurantsService = FavouriteRestaurantsService()) {
        self.restaurantsService = restaurantsService
        self.favouriteRestaurantsService = favouriteRestaurantsService
    }
    
    var viewModel: [MinifiedRestaurant] = [] {
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
                self.viewModel = response.data?.compactMap({ MinifiedRestaurantMapper.map(from: $0, favouriteRestaurantsService: self.favouriteRestaurantsService) }) ?? []
            case .failure:
                self.view?.showFetchError()
            }
        })
    }
    
    func didTapRetry() {
        fetchRestaurants()
    }
    
    func didTapHeart(_ restaurantId: String) {
        if let index = self.viewModel.firstIndex(where: {$0.uuid == restaurantId}) {
            favouriteRestaurantsService.toggleRestaurant(id: restaurantId)
            viewModel[index].toggleFavourite()
        }
    }
    
    func didTapSortByName() {
        viewModel.sort(by: { (firstRestaurant, secondRestaurant) -> Bool in
            return firstRestaurant.name < secondRestaurant.name
        })
    }
    
    func didTapSortByRating() {
        viewModel.sort(by: { (firstRestaurant, secondRestaurant) -> Bool in
            return firstRestaurant.theForkRatingValue > secondRestaurant.theForkRatingValue
        })
    }
    
}
