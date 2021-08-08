//
//  SearchView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.vertical, 3)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], alignment: .leading) {
                ForEach(0...10, id: \.self) { index in
                    Rectangle()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().preferredColorScheme(.dark)
    }
}
