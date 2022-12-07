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
    var onShowSpinnerCalledCount = 0
    var onHideSpinnerCalledCount = 0
    var onShowFetchErrorCalledCount = 0
    
    func updateUI() {
        onUpdateUICalledCount += 1
    }
    
    func showSpinner() {
        onShowSpinnerCalledCount += 1
    }
    
    func hideSpinner() {
        onHideSpinnerCalledCount += 1
    }
    
    func showFetchError() {
        onShowFetchErrorCalledCount += 1
    }
}
