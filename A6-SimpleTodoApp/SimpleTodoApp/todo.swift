//
//  todo.swift
//  SimpleTodoApp
//
//  Created by Richard Cho on 2020-05-03.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

struct todo {
    var title: String
    var todoDescription: String
    var priority: Priority
    var isCompleted: Bool = false
}

enum Priority: Int {
    case none = 0
    case low = 1
    case medium = 2
    case high = 3
    
    func description() -> String {
        switch self {
        case .none: return "None"
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
    
}
