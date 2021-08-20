//
//  ClearButtonView.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-19.
//

import SwiftUI

struct ClearButtonView: View {
    @State private var groupName = ""
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Name of the group")) {
                    TextField("Name of the group", text: $groupName).modifier(ClearButton(text: $groupName))
                }
            }
        }
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct ClearButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ClearButtonView()
    }
}
