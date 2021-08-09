//
//  SearchView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct SearchView: View {
    
    
    @EnvironmentObject var user: User
    @Environment(\.colorScheme) var currentMode
    @State private var search = ""
    @Binding var tabSelection: Int
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                VStack {
                    
                    TextField("Search ...", text: $search)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 17)
                        .disableAutocorrection(true)
                        .overlay(
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 17)
                                .padding(.vertical, 17)
                        )
                        
                        
                    
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 1) {
                            ForEach(user.posts) { post in
                                Button(action: { tabSelection = 5 }, label: {
                                    Image(uiImage: post.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geometry.size.width - 1) / 3, height: (geometry.size.width - 1) / 3)
                                        .foregroundColor(.gray)
                                        .clipped()
                                        .onTapGesture {
                                            tabSelection = 5
                                        }
                                })
                            }
                        }
                    }
                }
            }
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.top, 76)
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(tabSelection: .constant(2)).preferredColorScheme(.dark)
            .environmentObject(User())
    }
}
