//
//  Owner.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import Foundation

struct Owner: Codable {
    let name: String?
    let pictureURL: String?
    let rating: Rating?
    
    init(name: String?, pictureURL: String?, rating: Rating?) {
        self.name = name
        self.pictureURL = pictureURL
        self.rating = rating
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case pictureURL = "picture_url"
        case rating
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        pictureURL = try container.decode(String.self, forKey: .pictureURL)
        rating = try container.decode(Rating.self, forKey: .rating)
    }
}
