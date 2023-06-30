//
//  PopUpView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct PopUpWindow: View {
    var title: String
    var price: Int
    var weight: Int
    var description: String
    var image: String
    @Binding var show: Bool
    let action: () -> Void
    var body: some View {
        ZStack {
            if show {
                VStack {
                        VStack{
                            KFImage(URL(string: image))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                           
                        }
                            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 3.4 )
                            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                            .cornerRadius(10)
                            
                            .padding(5)
                        Spacer()
                   
                    Text(title)
                        .font(
                        Font.custom("SF Pro Display", size: 16)
                        .weight(.medium)
                        )
                        .kerning(0.16)
                        .foregroundColor(.black)
                        
                    Spacer()
                    HStack {
                        
                        Text("\(price) ₽")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(.black)
                            
                        Text("\(weight)г")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(.black.opacity(0.65))
                        
                        Spacer()
                            
                    }
                    Text(description)
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.65))
                        .frame(width: 311, height: 62, alignment: .leading)
                    
                    Button {
                        action()
                    } label: {
                        Text("Добавить в корзину")
                            .font(
                            Font.custom("SF Pro Display", size: 16)
                            .weight(.medium)
                            )
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50 )
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                   
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 20, maxHeight: UIScreen.main.bounds.height / 1.7)
                .background(Color.yellow)
                .cornerRadius(20)
            }
                
        }
    }
}

//struct PopUpWindow_Preview: PreviewProvider {
//    @State static var show: Bool = true
//    static var previews: some View {
//       
//     PopUpWindow(title: "kek", price: 1, weight: 2, description: "DAdasdsad", image: "", show: $show)
//    }
//}
