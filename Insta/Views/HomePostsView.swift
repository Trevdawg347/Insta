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
    @State private var likes:Int = 0
    @State private var alreadyliked = Bool()
    var geo: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.red)
                Text(user.username)
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(.horizontal, 8)
            .padding(.vertical, 5)
            
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
        
        
        ZStack {
            Image(uiImage: post.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: geo.size.width)
                .clipped()
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(alreadyliked ? .red: .clear)
                .onTapGesture(count: 2) {
                    if alreadyliked == false {
                        likes += 1
                    } else {
                        likes -= 1
                    }
                    alreadyliked.toggle()
                }
        }
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
            HStack {
                Image(systemName: alreadyliked ? "heart.fill": "heart")
                    .resizable()
                    .scaledToFit()
                    .fixedSize()
                    .foregroundColor(alreadyliked ? .red: .black)
                    .onTapGesture {
                        if alreadyliked == false {
                        likes += 1
                        } else {
                            likes -= 1
                        }
                        alreadyliked.toggle()
                    }
                if post.showComments { Image(systemName: "bubble.left") }
                if post.showLikes { Text("Likes: \(likes)") }
            }
            .padding()
            if post.caption != "" { Text("\(user.username): \(post.caption)").padding(.leading).padding(.bottom) }
        }
    }
}


