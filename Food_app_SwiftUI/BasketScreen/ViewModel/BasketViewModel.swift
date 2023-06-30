//
//  BasketViewModel.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 30.06.2023.
//

import Foundation
import Combine

class BasketViewModel: ObservableObject {
    let networkManager = NetworkServiceImpl()
    @Published var city: String = "Санкт - Петербург"
    var formattedDate: String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd MMMM, YYYY"
        return format.string(from: date)
    }
    
    @Published var dishes = [BasketModel]()
    var cancellables: Set<AnyCancellable> = []
    
    func loadDishes() {
        
            networkManager.loadDishes()
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                        
                    case .finished:
                        //                    print(self.menuData)
                        break
                    case .failure(let error):
                        print(error)
                    }
                } receiveValue: { data in
                    guard let dishes = data.dishes else { return }
                    
                    dishes.map { dish in
                        let item = BasketModel(image: dish.imageURL ?? "", title: dish.name ?? "", price: dish.price ?? 0, weight: dish.weight ?? 0, colvo: 1)
                        self.dishes.append(item)
//                        self.allTags.append(contentsOf: item.tags)
                    }
                    
                    
                    
                }.store(in: &cancellables)
            
        
    }
    
    init() {
        loadDishes()
    }
    
}
