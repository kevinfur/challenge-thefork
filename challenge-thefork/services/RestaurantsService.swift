//
//  RestaurantsService.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import Alamofire

protocol RestaurantsServiceProtocol: AnyObject {
    func getRestaurants(completion: @escaping (Result<RestaurantsResponseDTO, Error>) -> ())
}

final class RestaurantsService: RestaurantsServiceProtocol {
    
    static let shared = RestaurantsService()
    
    private init() { }
    
    struct Constants {
        static let restaurantsJsonURL = "https://alanflament.github.io/TFTest/test.json"
    }
    
    func getRestaurants(completion: @escaping (Result<RestaurantsResponseDTO, Error>) -> ()) {
        let url = Constants.restaurantsJsonURL        
        AF.request(url, method: .get).responseDecodable(of: RestaurantsResponseDTO.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
