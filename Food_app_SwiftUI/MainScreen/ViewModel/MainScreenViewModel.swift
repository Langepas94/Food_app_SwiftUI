//
//  MainScreenViewModel.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import Combine
import Kingfisher

class MainScreenViewModel: MainScreenViewModelProtocol {
    
    let networkManager = NetworkServiceImpl()
    
    @Published var categoriesData: [MainScreenModel] = [MainScreenModel]()
   
    @Published var city: String = "Санкт - Петербург"
    
    var selectedScreen = PassthroughSubject<String, Never>()
    
    @Published var selectedCategory: MainScreenModel?
    
    var cancellables: Set<AnyCancellable> = []
    
    var formattedDate: String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd MMMM, YYYY"
        return format.string(from: date)
    }
    
    func didSelectCategory(category: MainScreenModel) {
        selectedCategory = category
    }
    
    func sendData() {
        selectedScreen.sink { value in
            print("mum")
        }.store(in: &cancellables)
    }
    
    func loadData() {
        networkManager.loadCategories()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                     
                case .finished:

                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { data in
                guard let categories = data.сategories else { return }
                
                categories.map { category in
                    let item = MainScreenModel(title: category.name ?? "", image: category.imageURL ?? "")
                    self.categoriesData.append(item)
                }
               
                
                
            }.store(in: &cancellables)

    }
    
    init() {
        loadData()
    }
}

// 

extension MainScreenViewModel: ObservableObject {}
