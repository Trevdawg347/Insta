//
//  Login.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State var selection: String? = ""
    @EnvironmentObject var user: User
    let createTag = "create"
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                NavigationLink(destination: NewAccountView(),tag: createTag,selection: $selection,label: {})
                VStack {
                    TextField("Username", text: $username)
                        .padding(.horizontal)
                        .padding(.vertical, 25)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    SecureField("Password", text: $password)
                        .padding(.horizontal)
                        .padding(.vertical, 25)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    VStack {
                        Button("Login") {
                            user.isSignedIn = true
                        }
                        Button("Create Account") {
                            selection = createTag
                        }.padding(.vertical, 1)
                    }.padding()
                }
            }
        }.accentColor(.red)
    }
}
struct NewAccountView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
        NewAccountView()
            .preferredColorScheme(.dark)
    }
}
