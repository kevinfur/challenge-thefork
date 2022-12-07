//
//  MinifiedRestaurantMapperTest.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 06/12/2022.
//

import XCTest
@testable import challenge_thefork

class MinifiedRestaurantMapperTests: XCTestCase {
    
    let userDefaultsServiceMock = UserDefaultsService(settingsContainer: SettingsContainerMock())
    lazy var favouriteRestaurantsServiceMock = FavouriteRestaurantsService(userDefaultsService: userDefaultsServiceMock)

    func testMinifiedRestaurantMapper() {
        guard let restaurantDTOMock = JSONReader.read(file: "restaurant-mock", objectType: RestaurantDTO.self),
              let minifiedRestaurant = MinifiedRestaurantMapper.map(from: restaurantDTOMock, favouriteRestaurantsService: favouriteRestaurantsServiceMock) else {
            XCTFail("Error loading restaurant mock")
            return
        }
        
        XCTAssertEqual(minifiedRestaurant.uuid, "4eg4e2bn-1080-4e1e-8438-6t90ht123456")
        XCTAssertEqual(minifiedRestaurant.name, "Curry Garden")
        XCTAssertEqual(minifiedRestaurant.priceRange, 25)
        XCTAssertEqual(minifiedRestaurant.address, "89 Rue de Bagnolet")
        XCTAssertEqual(minifiedRestaurant.theForkRatingValue, 9.5)
        XCTAssertEqual(minifiedRestaurant.theForkReviewCount, 275)
        XCTAssertEqual(minifiedRestaurant.thumbnailURL?.absoluteString, "https://res.cloudinary.com/tf-lab/image/upload/f_auto,q_auto,w_80,h_60/restaurant/b1d8f006-2477-4715-b937-2c34d616dccb/68e364a6-e903-4fb1-9e1e-d91d97457266.jpg")
        XCTAssertEqual(minifiedRestaurant.isFavourite, false)
    }

}
