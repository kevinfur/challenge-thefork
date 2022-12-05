//
//  MinifiedRestaurant.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import Foundation

struct MinifiedRestaurant {
    let uuid: String
    let name: String
    let priceRange: Int
    let address: String
    let theForkRatingValue: Double
    let theForkReviewCount: Int
    let thumbnailURL: URL?
    var isFavourite: Bool
    
    mutating func toggleFavourite() {
        self.isFavourite = !self.isFavourite
    }
}
