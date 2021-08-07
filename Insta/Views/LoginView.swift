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
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.vertical, 3)
                SecureField("Password", text: $password)
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.vertical, 3)
                VStack {
                    Button("Login") {
                        MainView()
                    }
                }
            }
        }
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
