//
//  AppCoordinator.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation

protocol Coordinator {
    
}

final class AppCoordinator: Coordinator, ObservableObject {

    @Published var categoriesViewModel: MainScreenViewModel = MainScreenViewModel()
    @Published var detailViewModel: DetailScreenViewModel = DetailScreenViewModel()
    @Published var basketViewModel: BasketViewModel = BasketViewModel()
}
