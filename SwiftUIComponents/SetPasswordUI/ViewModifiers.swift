//
//  ViewModifiers.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-11.
//

import SwiftUI

struct titleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded).bold())
            .padding(.trailing, 110)
        }
}

struct secureFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded))
            .frame(height: 40)
            .padding(.horizontal)
            .padding(.vertical)
            .background(
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
                    .border(Color.gray.opacity(0.2), width: 2)
                    .cornerRadius(9)
            )
        }
}

struct confirmButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded))
                .foregroundColor(.gray)
                .frame(width: 200, height: 40)
                .padding(.horizontal)
                .padding(.vertical)
                .background(
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.2))
                        .cornerRadius(15)
                )
        }
}
