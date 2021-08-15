//
//  test.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-12.
//

import SwiftUI

struct test: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.modifier(secureFieldModifier())
            
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }.padding()
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test("test", text: .constant("string"))
    }
}
