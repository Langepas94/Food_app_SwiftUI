//
//  DetailScreen.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI

struct DetailScreen: View {
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    Text("First")
                        .frame(width: 200)
                    Text("Second")
                    Text("Third")
                    Text("Fourth")
                    Text("Fifth")
                    Text("Sixth")
                    
                }
                .padding(.horizontal, 16)
            }
        }.padding(.top)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
