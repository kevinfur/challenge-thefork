//
//  MinifiedRestaurantMapper.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import Foundation

struct MinifiedRestaurantMapper {
    
    private init() { }

    static func map(from restaurantDTO: RestaurantDTO) -> MinifiedRestaurant? {
        return MinifiedRestaurant(uuid: restaurantDTO.uuid,
                                  name: restaurantDTO.name,
                                  priceRange: restaurantDTO.priceRange,
                                  address: restaurantDTO.address.street,
                                  theForkRatingValue: restaurantDTO.aggregateRatings.thefork.ratingValue,
                                  theForkReviewCount: restaurantDTO.aggregateRatings.thefork.reviewCount,
                                  thumbnailURL: restaurantDTO.mainPhoto?.thumbnail)
    }
    
}
