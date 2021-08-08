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
            Rectangle()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.top, 60)
            VStack {
                HStack {
                    Text("Insta")
                        .font(Font.custom("Futura-Bold", size: 30))
                    Spacer()
                    Image(systemName: "ellipsis.bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .padding(.horizontal)
                
                ScrollView {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { users in
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .padding(.vertical)
                                    .padding(.leading)
                                    .foregroundColor(.red)
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
