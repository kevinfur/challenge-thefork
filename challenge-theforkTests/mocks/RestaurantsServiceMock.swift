//
//  RestaurantsServiceMock.swift
//  challenge-theforkTests
//
//  Created by Kevin Alan Furman on 06/12/2022.
//

import XCTest
@testable import challenge_thefork

class RestaurantsServiceMock: RestaurantsServiceProtocol {
    var shouldFail = false
    var noImages = false
    
    func getRestaurants(completion: @escaping (Result<RestaurantsResponseDTO, Error>) -> ()) {
        if !shouldFail {
            let mockFileName = noImages ? "restaurant-list-mock-no-images" : "restaurant-list-mock"
            if let responseMock = JSONReader.read(file: mockFileName, objectType: RestaurantsResponseDTO.self) {
                completion(.success(responseMock))
            } else {
                XCTFail("Error loading restaurant list mock")
            }
        } else {
            completion(.failure(ErrorMock.test))
        }
    }

}

enum ErrorMock: Error {
    case test
}
