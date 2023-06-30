//
//  DetailScreenViewModel.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import Combine

class DetailScreenViewModel: ObservableObject {
    
    let networkManager = NetworkServiceImpl()
    @Published var categories: [String] = Teg.allCases.map { teg in
        return teg.rawValue
    }
    @Published var allTags: [Teg] = [Teg]()
    @Published var menuData: [DetailScreenModel] = [DetailScreenModel]()
    @Published var modelsCount = 0
    var cancellables: Set<AnyCancellable> = []
    
    func loadData() {
        networkManager.loadDishes()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    
                case .finished:
                    //                    print(self.menuData)
                    print(self.allTags)
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { data in
                guard let dishes = data.dishes else { return }
                
                dishes.map { dish in
                    let item = DetailScreenModel(dishName: dish.name ?? "",dishImage: dish.imageURL ?? "", price: dish.price ?? 0, weight: dish.weight ?? 0, description: dish.description ?? "", tags: dish.tegs ?? [Teg]())
                    self.menuData.append(item)
                    self.allTags.append(contentsOf: item.tags)
                }
                
                
                
            }.store(in: &cancellables)
        
    }
    
    init() {
        loadData()
    }
    
}
