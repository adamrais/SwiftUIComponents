//
//  SetPasswordUIContentView.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-11.
//

import SwiftUI

struct SetPasswordUIContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
        }
    
    @State private var isChecked = false
    @State private var passwordField: String = ""
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Set Your Password")                        .modifier(titleModifier())
                }.padding()
                
                VStack(alignment: .leading) {
                    SecureField("", text: $passwordField)
                        .modifier(secureFieldModifier())
                }.padding()
                
                VStack(alignment: .leading) {
                    LabelViewComponent(title: "Add one special character", isChecked: $isChecked)
                    LabelViewComponent(title: "Add one number", isChecked: $isChecked)
                    LabelViewComponent(title: "Has more than 8 characters", isChecked: $isChecked)
                }
                
                Spacer()
                
                Button(action: {
                    isChecked.toggle()
                }, label: {
                    Text("Confirm")
                        .modifier(confirmButtonModifier())
                })
                
                Spacer()
            }.frame(minWidth: 0, maxHeight: 700, alignment: .topTrailing)
            .navigationTitle("Hello There!")
        }
    }
}

struct SetPasswordUIContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordUIContentView()
    }
}
