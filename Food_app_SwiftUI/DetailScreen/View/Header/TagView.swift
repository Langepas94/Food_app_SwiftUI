//
//  TagView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 30.06.2023.
//

import SwiftUI

struct TagView: View {
    let tag: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(tag)
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(isSelected ? .white : .black)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color(red: 0.97, green: 0.97, blue: 0.96))
                .cornerRadius(20)
                
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
////                        .stroke(Color.blue, lineWidth: 2)
//                        .opacity(isSelected ? 1 : 0)
//                )
        }
    }
}
