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
}

class RestaurantListPresenter: RestaurantListPresenterProtocol {
    
    weak var view: RestaurantListViewProtocol?
    
    var restaurants: [MinifiedRestaurant] = [] {
        didSet {
            view?.updateUI()
        }
    }
    
    func didLoad() {
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        RestaurantsService.shared.getRestaurants(completion: { result in
            switch result {
            case .success(let response):
                self.restaurants = response.data?.compactMap({ MinifiedRestaurantMapper.map(from: $0) }) ?? []
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
