//
//  SetPasswordUIContentView.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-11.
//

import SwiftUI
import Combine

struct SetPasswordUIContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
        }
    
    @State private var isChecked = false
    @State private var passwordField: String = ""
    @State private var isPasswordVisible = false
    @StateObject var vm = viewModel(hasSpecialChar: false, hasNumber: false, hasEnoughChar: false)
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Set Your Password")                        .modifier(titleModifier())
                }.padding()
                
                ZStack(alignment: .trailing) {
                    Group {
                        if isPasswordVisible {
                            TextField("", text: $vm.password)
                        } else {
                            SecureField("", text: $vm.password)
                        }
                    }.modifier(secureFieldModifier())
                    .onChange(of: vm.password) { value in
                        vm.hasSpecialChar = vm.hasSpecialChar(password: vm.password)
                        vm.hasNumber = vm.hasNumber(password: vm.password)
                        vm.hasEnoughChar = vm.hasEnoughChar(password: vm.password)
                    }
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: self.isPasswordVisible ? "eye" : "eye.slash")
                            .accentColor(.gray)
                    }.padding()
                }.padding()
                
                VStack(alignment: .leading) {
                    LabelViewComponent(title: "Has one special character", isChecked: $vm.hasSpecialChar)
                    LabelViewComponent(title: "Has one number", isChecked: $vm.hasNumber)
                    LabelViewComponent(title: "Has more than 8 characters", isChecked: $vm.hasEnoughChar)
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
