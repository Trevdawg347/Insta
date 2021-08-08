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
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    @EnvironmentObject var user: User
    
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
                                showImagePicker.toggle()
                                
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
                        Section(header: Text("Preview")) {
                            if image != nil {
                                Image(uiImage: image!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 310, height: 310)
                                HStack {
                                    Image(systemName: "heart")
                                    Image(systemName: "bubble.left")
                                    Text("0 Likes")
                                    Text("0 Comments")
                                }
                            }
                            if caption != "" {
                                Text(caption)
                            }
                        }
                        
                    } // Form
                    .padding(.top, 50)
                    
                    Button("Share") {
                        if image != nil {
                            user.posts.append(Posts(image: image!, caption: caption))
                            self.hideKeyboard()
                        }
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 40)
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerView(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
                    .preferredColorScheme(.dark)
                }
                
            } // ZStack

            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.red)
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .preferredColorScheme(.dark)
    }
}
