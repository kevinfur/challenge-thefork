//
//  RestaurantListViewSpy.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 07/12/2022.
//

@testable import challenge_thefork

class RestaurantListViewSpy: RestaurantListViewProtocol {
    var presenter: RestaurantListPresenterProtocol
    
    init(presenter: RestaurantListPresenterProtocol) {
        self.presenter = presenter
        self.presenter.view = self
    }
    
    var onUpdateUICalledCount = 0
    
    func updateUI() {
        onUpdateUICalledCount += 1
    }
}
