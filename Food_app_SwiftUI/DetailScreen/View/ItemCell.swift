//
//  ItemCell.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct ItemCell: View {
//    let index: Int
   @State var image: String
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let cellSize = screenWidth / 3 - 20
        
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.96))
            .frame(width: cellSize, height: cellSize)
            .overlay(
                KFImage(URL(string: image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            )
    }
}
