//
//  challenge_theforkTests.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import XCTest
@testable import challenge_thefork

class RestaurantListPresenterTests: XCTestCase {
    
    let userDefaultsServiceMock = UserDefaultsService(settingsContainer: SettingsContainerMock())
    lazy var favouriteRestaurantsServiceMock = FavouriteRestaurantsService(userDefaultsService: userDefaultsServiceMock)
    lazy var restaurantsServiceMock = RestaurantsServiceMock()
    lazy var presenter = RestaurantListPresenter(restaurantsService: restaurantsServiceMock,
                                                 favouriteRestaurantsService: favouriteRestaurantsServiceMock)
    var viewSpy: RestaurantListViewSpy?

    override func setUpWithError() throws {
        viewSpy = RestaurantListViewSpy(presenter: presenter)
    }

    func testPresenterLoad() throws {
        presenter.didLoad()
        XCTAssertEqual(viewSpy?.onUpdateUICalledCount, 1)
                
        XCTAssertEqual(presenter.restaurants.count, 10)
        let firstRestaurant = presenter.restaurants[0]
        XCTAssertEqual(firstRestaurant.uuid, "4eg4e2bn-1080-4e1e-8438-6t90ht123456")
        XCTAssertEqual(firstRestaurant.name, "Curry Garden")
        XCTAssertEqual(firstRestaurant.priceRange, 25)
        XCTAssertEqual(firstRestaurant.address, "89 Rue de Bagnolet")
        XCTAssertEqual(firstRestaurant.theForkRatingValue, 9.5)
        XCTAssertEqual(firstRestaurant.theForkReviewCount, 275)
        XCTAssertEqual(firstRestaurant.thumbnailURL?.absoluteString, "https://res.cloudinary.com/tf-lab/image/upload/f_auto,q_auto,w_80,h_60/restaurant/b1d8f006-2477-4715-b937-2c34d616dccb/68e364a6-e903-4fb1-9e1e-d91d97457266.jpg")
        XCTAssertEqual(firstRestaurant.isFavourite, false)
    }
    
    func testPresenterSortRestaurantsByName() throws {
        presenter.didLoad()
        presenter.didTapSortByName()
        let firstRestaurant = presenter.restaurants[0]
        let lastRestaurant = presenter.restaurants[presenter.restaurants.count-1]
        XCTAssertEqual(firstRestaurant.name, "Curry Garden")
        XCTAssertEqual(lastRestaurant.name, "Yasmin")
    }
    
    func testPresenterSortRestaurantsByRating() throws {
        presenter.didLoad()
        presenter.didTapSortByRating()
        let firstRestaurant = presenter.restaurants[0]
        let lastRestaurant = presenter.restaurants[presenter.restaurants.count-1]
        XCTAssertEqual(firstRestaurant.theForkRatingValue, 9.6)
        XCTAssertEqual(lastRestaurant.theForkRatingValue, 9.0)
    }
    
    func testPresenterHeartRestaurant() throws {
        presenter.didLoad()
        let restaurantId = "4eg4e2bn-1080-4e1e-8438-6t90ht123456"
        XCTAssertEqual(favouriteRestaurantsServiceMock.hasRestaurant(withId: restaurantId), false)
        presenter.didTapHeart(restaurantId)
        XCTAssertEqual(favouriteRestaurantsServiceMock.hasRestaurant(withId: restaurantId), true)
        XCTAssertEqual(viewSpy?.onUpdateUICalledCount, 2)
    }

}
