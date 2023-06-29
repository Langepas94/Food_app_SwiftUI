//
//  AppCoordinator.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation

enum AppCoordinatorNavigation {
    case homeCoordinator
    case searchCoordinator
    case basketCoordinator
    case accountCoordinator
}

final class AppCoordinator: Coordinator {
    @Published var navigationStack: [(AppCoordinatorNavigation, Any)] = []
    
    init() {
//        pushToNavigationStack(.homeFeedCoordinator, viewModel: FeedCoordinator(feed: .home))
//        pushToNavigationStack(.musicFeedCoordinator, viewModel: FeedCoordinator(feed: .music))
//        pushToNavigationStack(.accountCoordinator, viewModel: AccountCoordinator())
    }
}
