//
//  MessageView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/7/21.
//

import SwiftUI

struct MessageView: View {
    
    @State private var search: String = ""
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            TextField("Search...", text: $search)
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
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
            Spacer()
            ForEach(user.posts) { post in
                Image(uiImage: post.image)
            }
            Spacer()
        }
        
        
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .environmentObject(User())
    }
}
