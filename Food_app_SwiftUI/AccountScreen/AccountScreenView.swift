//
//  AccountScreenView.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 29.06.2023.
//

import SwiftUI

struct StickyHeaderViewExample: View {

    var stickyHeaderView: some View {
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color.gray)
            .frame(maxWidth: .infinity)
            .frame(height: 64)
            .overlay(
                Text("Section")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
            )
    }
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .center, spacing: 40, pinnedViews: [.sectionHeaders], content: {
                    ForEach(0...50, id: \.self) { count in
                        Section(header: stickyHeaderView) {
                            MyCell()
                        }
                    }
                })
            }
        }
    }
}

struct MyCell: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            HStack {
                Image(systemName: "heart")
                Text("WWDC 20")
                    .foregroundColor(.blue)
                    .font(.headline)
            }
            Text("PinnedScrollableViews")
                .foregroundColor(.blue)
                .font(.subheadline)
        }
    }
}
