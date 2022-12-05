//
//  RestaurantTableViewCell.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {

    let restaurantImageView = UIImageView()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let averagePriceLabel = UILabel()
    let heartImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        averagePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        
        restaurantImageView.contentMode = .scaleAspectFill
        restaurantImageView.clipsToBounds = true
        
        heartImageView.contentMode = .scaleAspectFit
        
        nameLabel.numberOfLines = 0
        addressLabel.numberOfLines = 0
        
        let descriptionStackView = UIStackView()
        descriptionStackView.axis = .vertical
        descriptionStackView.distribution = .fill
        descriptionStackView.spacing = 4
        descriptionStackView.addArrangedSubview(nameLabel)
        descriptionStackView.addArrangedSubview(addressLabel)
        descriptionStackView.addArrangedSubview(averagePriceLabel)
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(restaurantImageView)
        contentView.addSubview(descriptionStackView)
        contentView.addSubview(heartImageView)

        let viewsDict = [
            "superview": contentView,
            "image": restaurantImageView,
            "stack": descriptionStackView,
            "heart": heartImageView
        ]

        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(60)]->=8-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(80)]-[stack]-[heart(32)]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[stack]->=8-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:[superview]-(<=1)-[heart(32)]", options: .alignAllCenterY, metrics: nil, views: viewsDict))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with restaurant: MinifiedRestaurant) {
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        averagePriceLabel.text = "€ \(restaurant.priceRange)"
        
        heartImageView.image = AppImages.emptyHeart
        
        if let thumbnailURL = restaurant.thumbnailURL {
            restaurantImageView.af.setImage(withURL: thumbnailURL, placeholderImage: AppImages.noImage)
        } else {
            restaurantImageView.image = AppImages.noImage
        }
    }
    
}
