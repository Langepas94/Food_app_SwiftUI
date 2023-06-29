//
//  Food_app_SwiftUIApp.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 28.06.2023.
//

import SwiftUI

@main
struct Food_app_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
           AppCoordinatorView(coordinator: AppCoordinator())
        }
    }
}
