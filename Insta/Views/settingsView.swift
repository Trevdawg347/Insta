//
//  settingsView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var settingsList: [String] = [
        "Change Username", "Help", "Logout"
    ]
    @State private var selection: String? = ""
    @State private var tags: String = "tags"
    
    var body: some View {
        List {
            
            ForEach(settingsList, id: \.self) { index in
                HStack {
                    NavigationLink(destination: Text(index),label: {
                        Text(index)
                        })
                }
            }
        }
        .navigationTitle("Settings")
        .listStyle(GroupedListStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
        
    }
}
