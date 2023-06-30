//
//  BasketScreenView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 30.06.2023.
//

import SwiftUI

struct BasketScreenView: View {
    
    @StateObject var viewModel:  BasketViewModel
    
    var body: some View {
        VStack {
//            List(viewModel.dishes) { dish in
//                CustomCellView(product: dish)
//            }
//            .listStyle(PlainListStyle())
            ScrollView( showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.dishes, id: \.title) { dish in
                        CustomCellView(product: dish)
                                }
                            }
            }
        }
        
        .navigationBarItems(leading: VStack {
            Text(viewModel.city)
                .font(
                Font.custom("SF Pro Display", size: 18)
                .weight(.medium)
                )
                .foregroundColor(.black)
            Text(viewModel.formattedDate)
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black.opacity(0.5))
        })
        
        .padding([.leading, .trailing],  16)
        
    }
}

struct BasketScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BasketScreenView(viewModel: BasketViewModel())
    }
}
