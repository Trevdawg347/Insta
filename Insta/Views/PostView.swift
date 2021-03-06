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
    @Binding var tabSelection: Int
    
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

                        }
                        
                        Group {
                            Section(header: Text("Caption")) {
                                TextEditor(text: $caption)
                                    .disableAutocorrection(true)
                                
                            }
                            Section(header: Text("Settings")) {
                                Toggle("Allow Comments", isOn: $showComments)
                                    .toggleStyle(SwitchToggleStyle(tint: Color.red))
                                Toggle("Show Like Count", isOn: $showLikes)
                                    .toggleStyle(SwitchToggleStyle(tint: Color.red))
                                
                                
                            }
                            
                            if image != nil {
                                Section(header: Text("Preview")) {
                                    Image(uiImage: image!)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 310, height: 310)
                                    HStack {
                                        Image(systemName: "heart")
                                        if showComments { Image(systemName: "bubble.left") }
                                        if showLikes { Text("0 Likes") }
                                    }
                                    
                                    if caption != "" {
                                        Text(caption)
                                    }
                                }
                            }
                        }.onTapGesture {
                            self.hideKeyboard()
                        }
                        
                    } // Form
                    
                    Button(action: {
                        if image != nil {
                            user.posts.append(Posts(image: image!, caption: caption, showComments: showComments, showLikes: showLikes))
                            user.posts.append(Posts(image: image!, caption: caption, showComments: showComments, showLikes: showLikes))
                            user.posts.append(Posts(image: image!, caption: caption, showComments: showComments, showLikes: showLikes))
                            user.posts.append(Posts(image: image!, caption: caption, showComments: showComments, showLikes: showLikes))
                            self.hideKeyboard()
                            image = nil
                            caption = ""
                            showComments = true
                            showLikes = true
                            tabSelection = 1
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.red)
                                .cornerRadius(15)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .padding()
                            Text("Share")
                                .foregroundColor(.white)
                        }
                    })
                    .padding(.bottom, 40)
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerView(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
                    .accentColor(.red)
                }
                
            } // ZStack
            
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
        } //NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct PostView_Previews: PreviewProvider {
    @Binding var tabSelection: Int
    static var previews: some View {
        PostView(tabSelection: .constant(3))
            .preferredColorScheme(.dark)
    }
}
