//
//  RestaurantListPresenterSpy.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 07/12/2022.
//

@testable import challenge_thefork

class RestaurantListPresenterSpy: RestaurantListPresenterProtocol {
    var view: RestaurantListViewProtocol?
    
    var viewModel: [MinifiedRestaurant] = []
    
    var onDidLoadCalledCount = 0
    var onDidTapHeartCalledCount = 0
    var onDidTapSortByNameCalledCount = 0
    var onDidTapSortByRatingCalledCount = 0
    var onDidTapRetryCalledCount = 0
    
    func didLoad() {
        onDidLoadCalledCount += 1
    }
    
    func didTapHeart(_ restaurantId: String) {
        onDidTapHeartCalledCount += 1
    }
    
    func didTapSortByName() {
        onDidTapSortByNameCalledCount += 1
    }
    
    func didTapSortByRating() {
        onDidTapSortByRatingCalledCount += 1
    }
    
    func didTapRetry() {
        onDidTapRetryCalledCount += 1
    }
}
