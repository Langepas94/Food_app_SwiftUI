//
//  AppCoordinatorView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI
import Combine

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    @State private var shouldNavigate = false
    var body: some View {
        TabView {
            NavigationView {
                
                    MainScreenView(viewModel: coordinator.categoriesViewModel)
               
                    
                       
            }
           
            .tabItem {
                Image("главная").renderingMode(.template)
                Text("Главная")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
//                FeedCoordinatorView(coordinator: coordinator.viewModel(for: .musicFeedCoordinator))
            }
            .tabItem {
                Image("поиск").renderingMode(.template)
                Text("Поиск")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
//                AccountCoordinatorView(coordinator: coordinator.viewModel(for: .accountCoordinator))
                BasketScreenView(viewModel: BasketViewModel())
            }
            .tabItem {
                Image("корзина").renderingMode(.template)
                Text("Корзина")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
//                AccountCoordinatorView(coordinator: coordinator.viewModel(for: .accountCoordinator))
                
            }
            .tabItem {
                
                Image("аккаунт").renderingMode(.template)
                Text("Аккаунт")
            }
            .navigationViewStyle(.stack)
        }
            
    }

}


