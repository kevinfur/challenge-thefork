//
//  RestaurantListViewSnapshotTests.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 07/12/2022.
//

import XCTest
@testable import challenge_thefork
import SnapshotTesting

class RestaurantListViewSnapshotTests: XCTestCase {
    
    let userDefaultsServiceMock = UserDefaultsService(settingsContainer: SettingsContainerMock())
    lazy var favouriteRestaurantsServiceMock = FavouriteRestaurantsService(userDefaultsService: userDefaultsServiceMock)
    lazy var restaurantsServiceMock = RestaurantsServiceMock()
    lazy var presenter = RestaurantListPresenter(restaurantsService: restaurantsServiceMock,
                                                 favouriteRestaurantsService: favouriteRestaurantsServiceMock)
    var view: RestaurantListView?
    
    override func setUp() {
        super.setUp()
        restaurantsServiceMock.noImages = true
        view = RestaurantListView(presenter: presenter)
        isRecording = false
    }
    
    func testListView() throws {
        presenter.didLoad()
        if let view = view?.view {
            assertSnapshot(matching: view, as: .image)
        }
    }
    
    func testListViewWithFavourites() throws {
        presenter.didLoad()
        let restaurantId = "4eg4e2bn-1080-4e1e-8438-6t90ht123456"
        presenter.didTapHeart(restaurantId)
        if let view = view?.view {
            assertSnapshot(matching: view, as: .image)
        }
    }

}
