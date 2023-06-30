//
//  MainScreenView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI
import Kingfisher

struct MainScreenView: View {
    
    @StateObject var viewModel:  MainScreenViewModel
    
    var body: some View {
        accountView
    }
    
    @ViewBuilder
    var accountView: some View {
        
        VStack {
            ScrollView(showsIndicators: false) {
                let categories = viewModel.categoriesData
                ForEach(categories, id: \.title) { category in
                    NavigationLink(destination: DetailScreenView(viewModel: DetailScreenViewModel())) {
                            ZStack {
                                KFImage(URL(string: category.image ?? ""))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                Text(category.title)
                                    .font(Font.custom("SF Pro Display", size: 20).weight(.medium))
                                    .kerning(0.2)
                                    .foregroundColor(.black)
                                    .truncationMode(.tail)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                    .padding()
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
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel())
    }
}
