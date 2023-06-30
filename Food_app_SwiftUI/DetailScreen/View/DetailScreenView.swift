//
//  DetailScreenView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI


struct DetailScreenView: View {
    let screenSize = UIScreen.main.bounds
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @StateObject var viewModel:  DetailScreenViewModel
    
    @State var showingPopup = false
    
    @State var currentItemTapped: DetailScreenModel?
    
    @State private var selectedTags: [Teg] = []
    
    var stickyHeaderView: some View {
        
        HStack {
            HorizontalCategories(categories: viewModel.categories)
        }
        
    }
    var body: some View {
        
        ZStack {
            ScrollView {
                LazyVStack(alignment: .center, spacing: 0, pinnedViews: [.sectionHeaders], content: {
                    
                    Section(header: stickyHeaderView) {
                        
                        LazyVGrid(columns: gridItems) {
                            let categories = viewModel.menuData
                            ForEach(categories, id: \.dishName) { item in
                                VStack {
                                    ItemCell(image: item.dishImage)
                                    Text(item.dishName)
                                        .font(Font.custom("SF Pro Display", size: 14))
                                        .kerning(0.14)
                                        .foregroundColor(.black)
                                        .frame(width: 110, height: 30, alignment: .top)
                                       
                                }
                                .onTapGesture {
                                    showingPopup.toggle()
                                    self.currentItemTapped = item
                                }
                            }
                            
                        }
                        
                    }
                    .padding()
                    
                })
            }.navigationTitle("Кухня")
//                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: Text("<"))
                
            PopUpWindow(title: currentItemTapped?.dishName ?? "", price: currentItemTapped?.price ?? 0, weight: currentItemTapped?.weight ?? 0, description: currentItemTapped?.description ?? "", image: currentItemTapped?.dishImage ?? "", show: $showingPopup, action: {
                viewModel.selectedProductSubject.send(currentItemTapped!)
                viewModel.bind()
            })
                .opacity(showingPopup ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 0.2))
                
            
        }
        
    }
    
    
}




struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(viewModel: DetailScreenViewModel())
    }
}
