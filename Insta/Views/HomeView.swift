//
//  Home.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            VStack {
                Text("Insta")
                    .font(Font.custom("Futura-Bold", size: 30))
                    .padding(.leading)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
