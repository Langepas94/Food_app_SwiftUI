//
//  NetworkServiceImpl.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import Combine

class NetworkServiceImpl: NetworkManagerProtocol {
    static func baseURL() -> String {
        return "https://run.mocky.io/v3/"
    }
    
    func loadCategories() -> AnyPublisher<CategoriesNetworkDataModel, Error> {
        guard let url = URL(string: NetworkServiceImpl.baseURL() + FetchType.Categories.rawValue ) else { return Fail(error: NSError(domain: "Error", code: 0))
        .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CategoriesNetworkDataModel.self, decoder: JSONDecoder())
            .mapError{$0 as Error}
            .eraseToAnyPublisher()
    }
    
    func loadDishes() -> AnyPublisher<DishesDataModel, Error> {
        guard let url = URL(string: NetworkServiceImpl.baseURL() + FetchType.Dishes.rawValue ) else { return Fail(error: NSError(domain: "Error", code: 0)
        )
        .eraseToAnyPublisher()}
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: DishesDataModel.self, decoder: JSONDecoder())
            .mapError{$0 as Error}
            .eraseToAnyPublisher()
    }
}
