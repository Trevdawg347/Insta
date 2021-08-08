//
//  SearchView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search = ""
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        VStack {
            ZStack {
                TextField("    Search", text: $search)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.vertical, 3)
                    .padding()
                HStack {
                Image(systemName: "magnifyingglass")
                    .padding(40)
                    .foregroundColor(.gray)
                    Spacer()
                }
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<51) { index in
                        Rectangle()
                            .frame(height: 150)
                        
                    }
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
