//
//  MainModelProtocol.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation

protocol MainModelProtocol: Hashable  {
    
    var title: String { get set }
    var image: String { get set }
    
}
