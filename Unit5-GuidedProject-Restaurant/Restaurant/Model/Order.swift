//
//  Order.swift
//  Restaurant
//
//  Created by Richard Cho on 2020-05-16.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
