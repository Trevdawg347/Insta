//
//  Home.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) var currentMode
    @State private var selection: String? = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                
                NavigationLink(destination: MessageView(),tag: "messageView", selection: $selection, label: {})
                
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
                        Button(action: { selection = "messageView" }, label: {
                            Image(systemName: "ellipsis.bubble")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        })
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
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
                .navigationBarHidden(true)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
