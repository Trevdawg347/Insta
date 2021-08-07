//
//  Home.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(currentMode == .dark ? Color.black : Color.white)
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
