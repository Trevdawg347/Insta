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
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geo in
                ZStack(alignment: .topLeading) {
                    
                    NavigationLink(destination: MessageView(),tag: "messageView", selection: $selection, label: {})
                    
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(currentMode == .dark ? Color.black : Color.white)
                    VStack {
                        HStack {
                            Text("Insta")
                                .font(Font.custom("Futura-Bold", size: 30))
                            Spacer()
                            Button(action: { selection = "messageView" }, label: {
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                            })
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                        ScrollView(showsIndicators: false) {
                            LazyVStack(spacing: 0) {
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<10) { users in
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60)
                                                .padding(.leading)
                                                .padding(.vertical, 5)
                                                .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                                        }
                                    }
                                }.padding(.vertical, 3)
                                
                                ForEach(user.posts.reversed()) { post in
                                    HomePostsView(post: post, geo: geo)
                                }
                            }
                        }
                    }
                    
                    
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.4))
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .padding(.top, 73)
                    
                    
                } // ZStack
                .navigationBarHidden(true)
            } //Geometry Reader
        }// NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
            .environmentObject(User())
    }
}
