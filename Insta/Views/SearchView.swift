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
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.top, 75)
            VStack {
                ZStack {
                    TextField("    Search", text: $search)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                        .padding(.horizontal)

                    HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(25)
                        .foregroundColor(.gray)
                        Spacer()
                    }
                }
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<51) { index in
                            Rectangle()
                                .frame(height: 150)
                                .foregroundColor(.gray)
                            
                        }
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
