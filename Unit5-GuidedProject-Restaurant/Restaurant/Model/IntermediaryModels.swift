//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Richard Cho on 2020-05-16.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
