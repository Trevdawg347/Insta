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
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
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
                .foregroundColor(currentMode == .dark ? Color.white : Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.top, 75)
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(tabSelection: .constant(2)).preferredColorScheme(.dark)
    }
}
