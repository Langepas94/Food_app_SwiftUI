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
    
    @Published var menuData: [DetailScreenModel] = [DetailScreenModel]()
    
    var cancellables: Set<AnyCancellable> = []
    
    func loadData() {
        networkManager.loadDishes()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    
                case .finished:
                    print(self.menuData)
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { data in
                guard let dishes = data.dishes else { return }
                
                dishes.map { dish in
                    let item = DetailScreenModel(dishName: dish.name ?? "", dishImage: dish.imageURL ?? "")
                    self.menuData.append(item)
                }
               
                
                
            }.store(in: &cancellables)

    }
    
    init() {
        loadData()
    }
    
}
