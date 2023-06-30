//
//  DishesDataModel.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation

struct DishesDataModel: Codable {
    let dishes: [Dish]?
}

// MARK: - Dish
struct Dish: Codable {
    let id: Int?
    let name: String?
    let price, weight: Int?
    let description: String?
    let imageURL: String?
    let tegs: [Teg]?

    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description
        case imageURL = "image_url"
        case tegs
    }
}

enum Teg: String, Codable, CaseIterable {
    case всеМеню = "Все меню"
    case сРисом = "С рисом"
    case сРыбой = "С рыбой"
    case салаты = "Салаты"
}
