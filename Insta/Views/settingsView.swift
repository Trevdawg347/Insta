//
//  settingsView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/7/21.
//

import SwiftUI

struct settingsView: View {
    
    @State private var settingsList: [String] = [
        "Change Username", "Help", "Logout"
    ]
    
    var body: some View {
        List {
            ForEach(settingsList, id: \.self) { index in
                Text(index)
            }
        }.navigationTitle("Settings")
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            settingsView()
        }
        
    }
}
