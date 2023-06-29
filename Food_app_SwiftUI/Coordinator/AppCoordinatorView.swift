//
//  AppCoordinatorView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator
    var body: some View {
        TabView {
            NavigationView {
              
                    let viewModel = MainScreenViewModel()
                    MainScreenView(viewModel: viewModel)
                
//                FeedCoordinatorView(coordinator: coordinator.viewModel(for: .homeFeedCoordinator))
             
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


