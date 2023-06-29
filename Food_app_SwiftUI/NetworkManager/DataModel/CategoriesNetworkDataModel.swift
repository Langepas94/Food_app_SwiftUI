//
//  CategoriesDataModel.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation

struct CategoriesNetworkDataModel: Codable {
    let сategories: [Сategory]?
}

struct Сategory: Codable {
    let id: Int?
    let name: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}
