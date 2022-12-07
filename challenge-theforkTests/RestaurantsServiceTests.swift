//
//  RestaurantsServiceTests.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 07/12/2022.
//

import XCTest
import OHHTTPStubs
@testable import challenge_thefork

class RestaurantsServiceTests: XCTestCase {
    
    struct Constants {
        static let host = "alanflament.github.io"
        static let contentType = "application/json"
        static let restaurantListMockFileName = "restaurant-list-mock.json"
    }

    func testRestaurantsService() {
        let exp = expectation(description: "Testing restaurants service")
        
        stub(condition: isHost(Constants.host)) { _ in
            let stubPath = OHPathForFile(Constants.restaurantListMockFileName, type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type": Constants.contentType])
        }
        
        var mockedResponse: RestaurantsResponseDTO? = nil
        RestaurantsService.shared.getRestaurants(completion: { result in
            switch result {
            case .success(let response):
                mockedResponse = response
            case .failure:
                XCTFail("Error testing restaurants service")
            }
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 3)
        
        XCTAssertNotNil(mockedResponse)
        XCTAssertNotNil(mockedResponse?.data)
        XCTAssertEqual(mockedResponse?.data?.count, 10)
    }
    
    override func tearDown() {
        HTTPStubs.removeAllStubs()
    }

}
