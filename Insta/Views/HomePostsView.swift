//
//  HomePostsView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/9/21.
//

import SwiftUI

struct HomePostsView: View {
    
    @EnvironmentObject var user: User
    @State var post: Posts
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(.red)
                        Text(user.username)
                    }
                    Image(uiImage: post.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width)
                        .clipped()
                    HStack {
                        Image(systemName: "heart")
                        if post.showComments { Image(systemName: "bubble.left") }
                        if post.showLikes { Text("0 Likes") }
                        if post.showComments { Text("0 Comments") }
                    }
                    if post.caption != "" { Text(post.caption) }
                }
            }
        }
    }
}

