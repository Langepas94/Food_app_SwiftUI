//
//  MainScreenViewModelProtocol.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation

protocol MainScreenViewModelProtocol {
    var categoriesData: [MainScreenModel] { get set }
    var city: String { get set }
    func loadData()
    var formattedDate: String { get }
}

