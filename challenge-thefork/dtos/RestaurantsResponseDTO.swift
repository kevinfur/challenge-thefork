//
//  RestaurantsResponseDTO.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import Foundation

struct RestaurantsResponseDTO: Decodable {
    let data: [RestaurantDTO]?
}

struct RestaurantDTO: Decodable {
    let uuid: String
    let name: String
    let priceRange: Int
    let address: AddressDTO
    let aggregateRatings: AggregateRatingsDTO
    let mainPhoto: PhotoDTO?
}

struct AddressDTO: Decodable {
    let street: String
}

struct AggregateRatingsDTO: Decodable {
    let thefork: RatingsDTO
    let tripadvisor: RatingsDTO
}

struct RatingsDTO: Decodable {
    let ratingValue: Double
    let reviewCount: Int
}

struct PhotoDTO: Decodable {
    let thumbnail: URL
    
    enum CodingKeys: String, CodingKey {
        case thumbnail = "80x60"
    }
}
