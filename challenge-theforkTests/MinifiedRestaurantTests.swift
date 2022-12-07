//
//  MinifiedRestaurantTest.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 06/12/2022.
//

import XCTest
@testable import challenge_thefork

class MinifiedRestaurantTests: XCTestCase {
    
    func testMinifiedRestaurant() throws {
        var restaurant = MinifiedRestaurant(uuid: "4eg4e2bn-1080-4e1e-8438-6t90ht123456",
                                            name: "Curry Garden",
                                            priceRange: 25,
                                            address: "89 Rue de Bagnolet",
                                            theForkRatingValue: 9.5,
                                            theForkReviewCount: 275,
                                            thumbnailURL: URL(string: "https://res.cloudinary.com/tf-lab/image/upload/f_auto,q_auto,w_80,h_60/restaurant/b1d8f006-2477-4715-b937-2c34d616dccb/68e364a6-e903-4fb1-9e1e-d91d97457266.jpg"),
                                            isFavourite: false)
        
        XCTAssertEqual(restaurant.uuid, "4eg4e2bn-1080-4e1e-8438-6t90ht123456")
        XCTAssertEqual(restaurant.name, "Curry Garden")
        XCTAssertEqual(restaurant.priceRange, 25)
        XCTAssertEqual(restaurant.address, "89 Rue de Bagnolet")
        XCTAssertEqual(restaurant.theForkRatingValue, 9.5)
        XCTAssertEqual(restaurant.theForkReviewCount, 275)
        XCTAssertEqual(restaurant.thumbnailURL?.absoluteString, "https://res.cloudinary.com/tf-lab/image/upload/f_auto,q_auto,w_80,h_60/restaurant/b1d8f006-2477-4715-b937-2c34d616dccb/68e364a6-e903-4fb1-9e1e-d91d97457266.jpg")
        XCTAssertEqual(restaurant.isFavourite, false)
        
        restaurant.toggleFavourite()
        
        XCTAssertEqual(restaurant.isFavourite, true)
    }
    
}
