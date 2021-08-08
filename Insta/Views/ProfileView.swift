//
//  Profile.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var user: User
    @State var followers: Int = 0
    @State var following: Int = 0
    
    var body: some View {
        ZStack {
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
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }.padding()
                HStack {
                    Button("Follow") {
                        
                    }
                }
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().preferredColorScheme(.dark)
    }
}
