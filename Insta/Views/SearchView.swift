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
        VStack(alignment: .leading) {
            TextField("Search", text: $search)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.vertical, 3)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
