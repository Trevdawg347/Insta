//
//  Home.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var currentMode
    @State private var selection: String? = ""
    @EnvironmentObject var user: User
    init() {
        UITableView.appearance().contentInset.top = -35
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                
                NavigationLink(destination: MessageView(),tag: "messageView", selection: $selection, label: {})
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(currentMode == .dark ? Color.black : Color.white)
                Rectangle()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .padding(.top, 60)
                VStack {
                    HStack {
                        Text("Insta")
                            .font(Font.custom("Futura-Bold", size: 30))
                        Spacer()
                        Button(action: { selection = "messageView" }, label: {
                            Image(systemName: "bubble.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                        })
                        
                    }
                    .padding(.horizontal)
                    
                    List {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { users in
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .padding(.leading)
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        ForEach(user.posts, id: \.id) { post in
                            HStack {
                                Image(systemName: "person.circle")
                                Text("Username")
                            }
                            Image(uiImage: post.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 310, height: 310)
                            HStack {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.left")
                                Text("0 Likes")
                                Text("0 Comments")
                            }
                            if post.caption != "" {
                                Text(post.caption)
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(User())
    }
}
