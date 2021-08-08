//
//  PostView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct PostView: View {
    
    @State private var caption = ""
    @State private var showComments = true
    @State private var showLikes = true
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(currentMode == .dark ? Color.black : Color(red: 0.95, green: 0.95, blue: 0.95))
                VStack {
                    Form {
                        Section(header: Text("Image")) {
                            Button("Select Image...") {
                                
                            }
                            .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                        }
                        
                        
                        Section(header: Text("Caption")) {
                            TextEditor(text: $caption)
                                                    
                        }
                        Section(header: Text("Settings")) {
                            Toggle("Allow Comments", isOn: $showComments)
                                .toggleStyle(SwitchToggleStyle(tint: Color.red))
                            Toggle("Show Like Count", isOn: $showLikes)
                                .toggleStyle(SwitchToggleStyle(tint: Color.red))

                                                    
                        }
      
                    }
                    
                    Button("Share") {
                        
                    }
                    .padding(.bottom, 30)
                }
                
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
