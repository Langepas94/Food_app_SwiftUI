//
//  BasketItem.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 30.06.2023.
//

import SwiftUI
import Kingfisher

struct CustomCellView: View {
    
    @State var product: BasketModel
    @State private var quantity = 1
    var body: some View {
        HStack {
            KFImage(URL(string: product.image))
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            VStack {
                Text(product.title)
                    .font(Font.custom("SF Pro Display", size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black)
                
                HStack(alignment: .center) {
                    Text("\(product.price) ₽")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black)
                    Text("\(product.weight) г")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
           
            CenteredStepperView(value: $quantity, range: 1...10)
                .padding()

//            Stepper("Quantity: \(product.colvo)", value: $product.colvo, in: 1...10)
//                .labelsHidden()
        }
//        .padding(8)
    }
}
