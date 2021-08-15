//
//  ModelView.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-12.
//

import Foundation
import Combine

class viewModel: ObservableObject {
    private let firstLine = CurrentValueSubject<String, Never>("")
    
    @Published var password: String = "" {
        didSet {
            //firstLine.send(self.password)
        }
    }
    
    init(hasSpecialChar: Bool, hasNumber: Bool, hasEnoughChar: Bool) {
        self.hasSpecialChar = hasSpecialChar
        self.hasNumber = hasNumber
        self.hasEnoughChar = hasEnoughChar
    }
    
    @Published var hasSpecialChar: Bool
    @Published var hasNumber: Bool
    @Published var hasEnoughChar: Bool
    
    func hasEnoughChar(password: String) -> Bool {
        return password.count >= 8 ? true : false
    }
    
    func hasSpecialChar(password: String) -> Bool {
        if password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
            return false
        }
        return true
    }
    
    func hasNumber(password: String) -> Bool {
        if password.range(of: #"\d+"#, options: .regularExpression) == nil {
            return false
        }
        return true
    }
    
    
    
}
