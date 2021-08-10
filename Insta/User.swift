//
//  File.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    @Published var isSignedIn = Bool()
    @Published var username = "jonbuhler14"
    @Published var firstName = ""
    @Published var lastName = ""
    
    
    @Published var posts: [Posts] = []
}

struct Posts: Identifiable {
    
    var id = UUID()
    var image: UIImage
    var caption: String
    var showComments: Bool
    var showLikes: Bool
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
