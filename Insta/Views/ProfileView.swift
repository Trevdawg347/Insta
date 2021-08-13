//
//  Profile.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI



struct ProfileBarView: View {
    
    @State private var selection: String? = ""
    @State private var tags: String = "tag"
    @State private var settingsTag: String = "settings"
    @Environment(\.colorScheme) var currentMode
    @EnvironmentObject var user: User
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    
    var body: some View {
        NavigationLink(destination: SettingsView(), tag: settingsTag, selection: $selection, label: {})
        
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                Button(action: { showImagePicker.toggle() }, label: {
                    if image == nil {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundColor(currentMode == .dark ? .white : .black)
                            .frame(width: 90, height: 90)
                    } else {
                        Image(uiImage: image!)
                            .resizable()
                            .frame(width: 90, height: 90)
                            .scaledToFill()
                            .clipShape(Circle())
                    }
                })
                
                
                Spacer()
                Text("0\nFollowers")
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .padding(.top, 20)
                Text("0\nFollowing")
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .padding(.top, 20)
                Spacer()
                Button(action: {
                    selection = settingsTag
                }, label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                })
                
            }
            .padding(.top)
            .padding(.horizontal)
            Text(user.username)
                .padding(.leading)
                .padding(.top)
            NavigationLink(destination: Text("Edit Profile"), tag: tags, selection: $selection, label: {})
            Button(action: {
                selection = tags
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .padding()
                    Text("Edit Profile").foregroundColor(.white)
                    
                }
            })
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.4))
                .frame(maxWidth: .infinity, maxHeight: 1)
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: .photoLibrary) { image in
                self.image = image
            }
            .accentColor(.red)
        }
        .navigationBarHidden(true)
    }
}


struct ProfileView: View {
    
    @EnvironmentObject var user: User
    @State private var followers: Int = 0
    @State private var following: Int = 0
    @Environment(\.colorScheme) var currentMode
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
        GridItem(.flexible(), spacing: 2, alignment: nil),
    ]
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    ZStack(alignment: .top) {
                        VStack(spacing: 0) {
                            
                            ProfileBarView()
                            
                            LazyVGrid(columns: columns, spacing: 1) {
                                ForEach(user.posts) { post in
                                    Image(uiImage: post.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geometry.size.width - 1) / 3, height: (geometry.size.width - 1) / 3)
                                        .foregroundColor(.gray)
                                        .clipped()
                                }
                            }
                        }
                    }
                } //ZStack
            } //ScrollView
            .navigationBarHidden(true)
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        
    } //GeometryReader
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView()
            .preferredColorScheme(.dark)
            .environmentObject(User())
        
        
    }
}
