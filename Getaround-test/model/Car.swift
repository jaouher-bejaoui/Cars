//
//  Car.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import Foundation

struct Car: Identifiable, Codable {
    let id: String?
    let brand: String?
    let model: String?
    let pictureURL: String?
    let pricePerDay: Int?
    let rating: Rating?
    let owner: Owner?
    let isLiked: Bool = false

    init(id: String?,
         brand: String?,
         model: String?,
         pictureURL: String?,
         pricePerDay: Int?,
         rating: Rating?,
         owner: Owner?) {
        self.id = id
        self.brand = brand
        self.model = model
        self.pictureURL = pictureURL
        self.pricePerDay = pricePerDay
        self.rating = rating
        self.owner = owner
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case brand
        case model
        case pictureURL = "picture_url"
        case pricePerDay = "price_per_day"
        case rating
        case owner
    }
}
