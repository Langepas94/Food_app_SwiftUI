//
//  BasketModel.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 30.06.2023.
//

import Foundation

struct BasketModel: Identifiable {
    let id = UUID()
    var image: String
    var title: String
    var price: Int
    var weight: Int
    var colvo: Int
}
