//
//  Coordinator.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype NavigationItem: Equatable
    
    var navigationStack: [(NavigationItem, Any)] { get set }
}

protocol Navigable {
    associatedtype NavigationItem: Equatable
    
    var onNavigation: ((NavigationItem) -> Void)! { get }
}

extension Coordinator {
    func isActive(_ item: NavigationItem) -> Binding<Bool> {
        return .constant(navigationStack.contains(where: { $0.0 == item }))
    }
    
    func viewModel<T: ObservableObject>(for item: NavigationItem) -> T {
        guard let i = navigationStack.first(where: { $0.0 == item }) else {
            fatalError("Item not in stack.")
        }
        guard let vm = i.1 as? T else {
            fatalError("View model type is not correct.")
        }
        return vm
    }
    
    func pushToNavigationStack(_ item: NavigationItem, viewModel: Any) {
        navigationStack.append((item, viewModel))
    }
    
    func popFromNavigationStack() {
        navigationStack.removeLast()
    }
}
