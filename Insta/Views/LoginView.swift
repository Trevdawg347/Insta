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
                    Text("Insta")
                        .font(Font.custom("Futura-Bold", size: 50))
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    SecureField("Password", text: $password)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .cornerRadius(15)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 40)
                        
                        Text("Login")
                    }
                    .onTapGesture {
                        user.isSignedIn = true
                    }
                    ZStack {
                        Text("Create Account")
                            .foregroundColor(.red)
                    }
                    .onTapGesture {
                        selection = createTag
                    }
                    
                    
                    
                    
                    Spacer()
                        .padding()
                    
                } //VStack
            } //ZStack
        } //Navigation View
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.red)
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
