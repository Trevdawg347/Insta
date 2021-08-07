//
//  ContentView.swift
//  Insta
//
//  Created by Wendy Buhler on 8/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
            ZStack {
                Text("sup")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
