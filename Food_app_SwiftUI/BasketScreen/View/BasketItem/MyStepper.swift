//
//  MyStepper.swift
//  Food_app_SwiftUI
//
//  Created by Artem on 30.06.2023.
//

import Foundation
import SwiftUI

struct CenteredStepperView: View {
    @Binding var value: Int
    var range: ClosedRange<Int>
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                if value > range.lowerBound {
                    value -= 1
                }
            }) {
                Image(systemName: "minus")
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)
                    .padding(.leading, 8)
            }
            
            Text("\(value)")
                .font(
                Font.custom("SF Pro Display", size: 14)
                .weight(.medium)
                )
                .kerning(0.14)
                .foregroundColor(.black)                .padding([.leading, .trailing], 5)
            
            Button(action: {
                if value < range.upperBound {
                    value += 1
                }
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 8)
                    
            }
        }
        .background(Color(red: 0.94, green: 0.93, blue: 0.93))
        .cornerRadius(5)
//        .font(.system(size: 24))
    }
}


