//
//  LabelViewComponent.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-11.
//

import SwiftUI

struct LabelViewComponent: View {
    var title: String
    @Binding var isChecked: Bool
    var body: some View {
        Label(
            title: {
                Text(title)
            },
            icon: {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
            }).font(.system(size: 20))
            .foregroundColor(isChecked ? Color("darkGreen") : .black)
            .padding(.trailing, 80)
    }
}

struct LabelViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        LabelViewComponent(title: "add something", isChecked: .constant(false))
    }
}
