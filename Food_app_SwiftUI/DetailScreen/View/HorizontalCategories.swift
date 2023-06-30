//
//  DetailScreen.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI

struct HorizontalCategories: View {
    
    @State var categories: [String]
    @State private var selectedTags: [Teg] = []
    
    @State var selected: Bool = false
    
 
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(categories, id: \.hashValue) { tag in
                        TagView(tag: tag, isSelected: selected) {
                            selected.toggle()
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HorizontalCategories(categories: ["One", "Two"])
//    }
//}
