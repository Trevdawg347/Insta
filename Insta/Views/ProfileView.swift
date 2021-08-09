//
//  Profile.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var user: User
    @State private var followers: Int = 0
    @State private var following: Int = 0
    @State private var selection: String? = ""
    @State private var tags: String = "tag"
    @State private var settingsTag: String = "settings"
    @Environment(\.colorScheme) var currentMode
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    NavigationLink(destination: SettingsView(), tag: settingsTag, selection: $selection, label: {})
                    VStack {
                        HStack(alignment: .top) {
                            VStack(alignment: .center) {
                                Button(action: {}, label: {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .foregroundColor(currentMode == .dark ? .white : .black)
                                        .frame(width: 90, height: 90)
                                })
                                Text("Username")
                            }
                            Spacer()
                            Text("0\nFollowers")
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .padding(.top, 20)
                            Text("0\nFollowing")
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .padding(.top, 20)
                            
                            Button(action: {
                                selection = settingsTag
                            }, label: {
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.red)
                            })
                            
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        
                        NavigationLink(destination: Text("Edit Profile"), tag: tags, selection: $selection, label: {})
                        Button(action: {
                            selection = tags
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.red)
                                    .cornerRadius(15)
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .padding()
                                Text("Edit Profile").foregroundColor(.white)
                                
                            }
                        })
                        Spacer()
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(user.posts) { post in
                                    Image(uiImage: post.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geometry.size.width - 1) / 3, height: (geometry.size.width - 1) / 3)
                                        .foregroundColor(.gray)
                                        .clipped()
                                }
                            }
                        }
                    }
                    Rectangle()
                        .foregroundColor(currentMode == .dark ? Color.white : Color.gray.opacity(0.4))
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .padding(.top, 222)
                    
                } // ZStack
                
                .navigationBarHidden(true)
            } // NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView()
            .preferredColorScheme(.dark)
        
        
    }
}
