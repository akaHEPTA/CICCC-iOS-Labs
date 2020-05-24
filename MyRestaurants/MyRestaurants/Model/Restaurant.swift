//
//  Restaurant.swift
//  MyRestaurants
//
//  Created by Richard Cho on 2020-05-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

struct Restaurant {
    
    let name: String
    let typeOfFood: TypeOfFood
    let image: String
    let mealTime: MealTime
    
    enum TypeOfFood {
        case american
        case chinese
        case greek
        case indian
        case italian
        case japanese
        case korean
        case mexican
        case middleEastern
        case taiwanese
        case vietnamese
    }
    
    enum MealTime {
        case breakfast
        case lunch
        case dinner
    }
    
}

// MARK: - Restaurant.TypeOfFood: CaseIterable
extension Restaurant.TypeOfFood: CaseIterable { }

// MARK: - Restaurant.TypeOfFood: RawRepresentable
extension Restaurant.TypeOfFood: RawRepresentable {
    
    typealias RawValue = String
    
    init?(rawValue: String) {
        switch rawValue {
        case "American": self = .american
        case "Chinese": self = .chinese
        case "Greek": self = .greek
        case "Indian": self = .indian
        case "Italian": self = .italian
        case "Japanese": self = .japanese
        case "Korean": self = .korean
        case "Mexican": self = .mexican
        case "MiddleEstern": self = .middleEastern
        case "Taiwanese": self = .taiwanese
        case "Vietnamese": self = .vietnamese
        default: return nil
        }
    }
    
    var rawValue: String {
        switch self {
        case .american: return "American"
        case .chinese: return "Chinese"
        case .greek: return "Greek"
        case .indian: return "Indian"
        case .italian: return "Italian"
        case .japanese: return "Japanese"
        case .korean: return "Korean"
        case .mexican: return "Mexican"
        case .middleEastern: return "MiddleEstern"
        case .taiwanese: return "Taiwanese"
        case .vietnamese: return "Vietnamese"
        }
    }

}

// MARK: - Restaurant.MealTime: CaseIterable
extension Restaurant.MealTime: CaseIterable { }

// MARK: - Restaurant.MealTime: RawRepresentable
extension Restaurant.MealTime: RawRepresentable {

    typealias RawValue = String

    init?(rawValue: String) {
        switch rawValue {
        case "Breakfast": self = .breakfast
        case "Lunch": self = .lunch
        case "Dinner": self = .dinner
        default: return nil
        }
    }
    
    var rawValue: String {
        switch self {
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        }
    }
    
}
