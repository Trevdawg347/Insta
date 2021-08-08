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
            NavigationLink(destination: Text("New"), tag: tags, selection: $selection, label: {})
            ForEach(settingsList, id: \.self) { index in
                HStack {
                    Button(index) {
                        selection = tags
                    }
                    Spacer()
                    Image(systemName: "arrow.right")
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
