//
//  Login.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
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
                    Form {
                        
                        TextField("Email", text: $email)

                        SecureField("Password", text: $password)

                    }
                    
                    Spacer()
                    
                    Button(action: { user.isSignedIn = true }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.red)
                                .cornerRadius(15)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .padding()
                            Text("Login")
                                .foregroundColor(.white)
                        }
                    })
                    
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


struct NewAccountView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @Environment(\.colorScheme) private var currentMode
    @EnvironmentObject var user: User
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(currentMode == .dark ? Color.black : Color(red: 0.95, green: 0.95, blue: 0.95))
            VStack {
                Form {
                    Section(header: Text("Username")) {
                        TextField("Username", text: $username)
                    }
                    Section(header: Text("NAME")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                    
                    
                    Section(header: Text("Email")) {
                        TextField("Email", text: $email)
                    }
                    
                    Section(header: Text("Password")) {
                        SecureField("Password", text: $password)
                    }
                    
                    
                    
                }
                
                Button(action: { user.isSignedIn = true }, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .padding()
                        Text("Create Account")
                            .foregroundColor(.white)
                    }
                })
            }
            .navigationTitle("New Account")
        }
        
    }
}

struct Login_Previews: PreviewProvider {
    @Environment(\.colorScheme) var currentMode
    static var previews: some View {
        LoginView().preferredColorScheme(.dark)
        NavigationView {
            NewAccountView()
        }.preferredColorScheme(.light)
        
        
    }
}
