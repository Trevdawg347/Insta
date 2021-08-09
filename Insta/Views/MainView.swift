//
//  ContentView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/6/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var user: User
    @State private var tabSelection = 1
    
    var body: some View {
        
        if user.isSignedIn == true {
            
            TabView(selection: $tabSelection) {
                HomeView()
                    .tabItem { Image(systemName: "house") }.tag(1)
                SearchView(tabSelection: $tabSelection)
                    .tabItem { Image(systemName: "magnifyingglass") }.tag(2)
                PostView(tabSelection: $tabSelection)
                    .tabItem { Image(systemName: "plus.square") }.tag(3)
                ActivityView()
                    .tabItem { Image(systemName: "heart") }.tag(4)
                ProfileView()
                    .tabItem { Image(systemName: "person.circle") }.tag(5)
                
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
