//
//  settingsView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var user: User
    
    var body: some View {
        List {
            NavigationLink(destination: ChangeUsernameView(), label: {
                Text("Change Username")
            })
            NavigationLink(destination: ChangeBioView() ,label: {
                Text("Change Bio")
            })
            NavigationLink(destination: HelpView(), label: {
                Text("Help")
            })
            Button("Logout") {
                user.isSignedIn = false
            }            
        }
        .navigationTitle("Settings")
        .listStyle(GroupedListStyle())
    }
}


struct ChangeUsernameView: View {
    
    @State private var newUsername: String = ""
    
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("New Username")) {
                    TextField("Username", text: $newUsername)
                    
                }
                
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

struct HelpView: View {
    var body: some View {
        Text("Here is your help.")
    }
}

struct ChangeBioView: View {
    
    @State private var changeBio: String = ""
    
    var body: some View {
        ZStack {
            
            Form {
                Section(header: Text("New Bio")) {
                TextField("Change Bio", text: $changeBio)
            }
            .onTapGesture {
                self.hideKeyboard()
        }
            }
            
    }
}
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .environmentObject(User())
        
    }
}
