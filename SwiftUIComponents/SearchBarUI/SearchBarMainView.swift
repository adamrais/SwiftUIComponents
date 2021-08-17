//
//  SearchBarMainView.swift
//  SwiftUIComponents
//
//  Created by Adam Rais on 2021-08-15.
//

import SwiftUI

struct SearchBarMainView: View {
    @State private var searchText = "helloWorld"
    
    var body: some View {
        SearchBar(text: $searchText)
            .padding(.top, -30)
    }
}

struct SearchBarMainView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarMainView()
    }
}
