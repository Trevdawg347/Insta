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
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: SettingsView(), tag: settingsTag, selection: $selection, label: {})
                VStack {
                    HStack(alignment: .top) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                        Spacer()
                        VStack {
                            Button("Following") {
                                user.isSignedIn = false
                            }
                            .foregroundColor(.red)
                            Button(String(following)) {
                                user.isSignedIn = false
                            }
                            .foregroundColor(.red)
                        }
                        Spacer()
                        VStack {
                            Button("Followers") {
                                user.isSignedIn = false
                            }
                            .foregroundColor(.red)
                            Button(String(followers)) {
                                user.isSignedIn = false
                            }
                            .foregroundColor(.red)
                        }
                        Spacer()
                        
                        Button(action: {
                            selection = settingsTag
                        }, label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                        })
                    }.padding()
                    NavigationLink(destination: Text("Edit Profile"), tag: tags, selection: $selection, label: {})
                    Button(action: {
                        selection = tags
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 50)
                                .cornerRadius(15)
                            Text("Edit Profile").foregroundColor(.white)
                            
                        }
                    })
                    Spacer()
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<51) { index in
                                Rectangle()
                                    .frame(height: 150)
                                
                            }
                        }
                    }
                }
                
            }.navigationBarHidden(true)
    } // NavigationView
    .navigationViewStyle(StackNavigationViewStyle())
    
}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView()
            .preferredColorScheme(.dark)
        
        
    }
}
