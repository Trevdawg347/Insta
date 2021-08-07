//
//  ContentView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/6/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
