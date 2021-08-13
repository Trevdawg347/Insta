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
    @State private var alreadyLiked = Bool()
    @State private var likedColor: Color = .clear
    var geo: GeometryProxy
    @Environment(\.colorScheme) var currentMode
    
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
                .onTapGesture(count: 2) { like() }
            if alreadyLiked {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: geo.size.width/2, height: geo.size.width/2)
            }
        }
        
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
            HStack {
                Image(systemName: alreadyLiked ? "heart.fill": "heart")
                    .resizable()
                    .scaledToFit()
                    .fixedSize()
                    .foregroundColor(alreadyLiked ? .red : currentMode == .dark ? .white : .black)
                    .onTapGesture { like() }
                if post.showComments { Image(systemName: "bubble.left") }
                if post.showLikes { Text("Likes: \(likes)") }
            }
            .padding()
            if post.caption != "" { Text("\(user.username): \(post.caption)").padding(.leading).padding(.bottom) }
        }
    }
    func like() {
        if !alreadyLiked {
            likes += 1
        } else {
            likes -= 1
        }
        alreadyLiked.toggle()
    }
}



