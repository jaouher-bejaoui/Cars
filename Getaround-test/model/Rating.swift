//
//  Rating.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import Foundation

struct Rating: Codable {
    let average: Double?
    let count: Int?
    
    init(average: Double?, count: Int?) {
        self.average = average
        self.count = count
    }
    
    private enum CodingKeys: String, CodingKey {
        case average
        case count
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        
        average = try container.decode(Double.self, forKey: .average)
        count = try container.decode(Int.self, forKey: .count)
    }
}
