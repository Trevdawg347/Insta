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
    @Environment(\.colorScheme) var currentMode
    
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: NewAccountView(),tag: createTag,selection: $selection,label: {})
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(currentMode == .dark ? Color.black : Color.white)
                
                VStack {
                    Spacer()
                    Text("Insta")
                        .font(Font.custom("Futura-Bold", size: 50))
                        .padding()
                        .padding(.top, 50)
                    TextField("Username", text: $username)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    SecureField("Password", text: $password)
                        .padding(.horizontal)
                        .padding(.vertical, 15)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .padding()
                        
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
                    .padding(.bottom)
                    
                } //VStack
                .padding(.bottom, 25)
            } //ZStack
            .navigationBarHidden(true)
            .onTapGesture {
                self.hideKeyboard()
            }
            
        } //Navigation View
        
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(.red)
    }
}
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct NewAccountView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct Login_Previews: PreviewProvider {
    @Environment(\.colorScheme) var currentMode
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            LoginView().preferredColorScheme(scheme)
        }
        
    }
}
