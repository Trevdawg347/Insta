//
//  ContentView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/6/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        
        if user.isSignedIn == true {
            
            TabView {
                HomeView()
                    .tabItem { Image(systemName: "house") }
                SearchView()
                    .tabItem { Image(systemName: "magnifyingglass") }
                PostView()
                    .tabItem { Image(systemName: "plus.square") }
                ActivityView()
                    .tabItem { Image(systemName: "heart") }
                ProfileView()
                    .tabItem { Image(systemName: "person.circle") }
                
            }.accentColor(.red)
            
        } else {
            LoginView()
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            MainView()
                .preferredColorScheme(scheme)
                .environmentObject(User())
        }
        .previewDevice("iPad (8th generation)")
    }
}
