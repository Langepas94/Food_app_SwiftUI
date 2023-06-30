//
//  DetailScreen.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI

struct HorizontalCategories: View {
    
    @State var categories: [Teg]
    @State private var selectedTags: [Teg] = []
    
 
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(categories, id: \.rawValue) { tag in
                        TagView(tag: tag, isSelected: true) {
                            print("mem")
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
