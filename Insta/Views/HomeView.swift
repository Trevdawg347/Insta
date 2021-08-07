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
                HStack {
                    Text("Insta")
                        .font(Font.custom("Futura-Bold", size: 30))
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                    Image(systemName: "ellipsis.bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.trailing)
                        .padding(.top)
                }
                .ignoresSafeArea()
                
                ScrollView {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { users in
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                                    .padding(.bottom)
                                    .padding(.leading)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
