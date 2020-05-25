//
//  Restaurant.swift
//  MyRestaurants
//
//  Created by Richard Cho on 2020-05-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

struct Restaurant {
    
   static let getAll: [Restaurant] = [
        Restaurant(
            name: "It Char Burger",
            typeOfFood: .american,
            image: "1",
            mealTime: .breakfast),
        Restaurant(
            name: "Angelina's",
            typeOfFood: .american,
            image: "2",
            mealTime: .breakfast),
        Restaurant(
            name: "Chan's Garden",
            typeOfFood: .chinese,
            image: "3",
            mealTime: .lunch),
        Restaurant(
            name: "North Noddle House",
            typeOfFood: .chinese,
            image: "4",
            mealTime: .lunch),
        Restaurant(
            name: "Taverna Greka Restaurant",
            typeOfFood: .greek,
            image: "5",
            mealTime: .lunch),
        Restaurant(
            name: "Stefano Restaurant",
            typeOfFood: .greek,
            image: "6",
            mealTime: .dinner),
        Restaurant(
            name: "Indian Bombay Bistro",
            typeOfFood: .indian,
            image: "7",
            mealTime: .dinner),
        Restaurant(
            name: "Royal Tandoori Indian Restaurant",
            typeOfFood: .indian,
            image: "8",
            mealTime: .dinner),
        Restaurant(
            name: "Artusi Restaurant",
            typeOfFood: .italian,
            image: "9",
            mealTime: .dinner),
        Restaurant(
            name: "Piva Modern Italian",
            typeOfFood: .italian,
            image: "10",
            mealTime: .lunch),
        Restaurant(
            name: "Sushi Modo",
            typeOfFood: .japanese,
            image: "11",
            mealTime: .lunch),
        Restaurant(
            name: "Victoria Sushi",
            typeOfFood: .japanese,
            image: "12",
            mealTime: .dinner),
        Restaurant(
            name: "Na-Re Korean Kitchen",
            typeOfFood: .korean,
            image: "13",
            mealTime: .dinner),
        Restaurant(
            name: "Misita Korean Cuisine",
            typeOfFood: .korean,
            image: "14",
            mealTime: .lunch),
        Restaurant(
            name: "Taqueria Playa Tropical",
            typeOfFood: .mexican,
            image: "15",
            mealTime: .lunch),
        Restaurant(
            name: "El Santo",
            typeOfFood: .mexican,
            image: "16",
            mealTime: .dinner),
        Restaurant(
            name: "Wild Thyme",
            typeOfFood: .middleEastern,
            image: "17",
            mealTime: .dinner),
        Restaurant(
            name: "Zaaki Cuisine",
            typeOfFood: .middleEastern,
            image: "18",
            mealTime: .breakfast),
        Restaurant(
            name: "The One Restaurant",
            typeOfFood: .taiwanese,
            image: "19",
            mealTime: .breakfast),
        Restaurant(
            name: "Old Street",
            typeOfFood: .taiwanese,
            image: "20",
            mealTime: .lunch),
        Restaurant(
            name: "Co Chau",
            typeOfFood: .vietnamese,
            image: "21",
            mealTime: .breakfast),
        Restaurant(
            name: "Banh Mi Bar Restaurant",
            typeOfFood: .vietnamese,
            image: "22",
            mealTime: .lunch)
    ]
    
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
        case "Middle Eastern": self = .middleEastern
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
        case .middleEastern: return "Middle Eastern"
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
