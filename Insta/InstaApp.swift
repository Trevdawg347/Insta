//
//  InstaApp.swift
//  Insta
//
//  Created by Wendy Buhler on 8/6/21.
//

import SwiftUI

@main
struct InstaApp: App {
    
    @StateObject var user = User()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(user)
        }
    }
}
