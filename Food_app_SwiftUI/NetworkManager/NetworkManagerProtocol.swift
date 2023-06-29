//
//  NetworkManagerProtocol.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import Combine

enum FetchType: String {
    case Categories = "058729bd-1402-4578-88de-265481fd7d54"
    case Dishes = "aba7ecaa-0a70-453b-b62d-0e326c859b3b"
}

protocol NetworkManagerProtocol {
    static func baseURL() -> String
    
    func loadCategories() -> AnyPublisher<CategoriesNetworkDataModel, Error>
    
    func loadDishes() -> AnyPublisher<DishesDataModel, Error>
}
