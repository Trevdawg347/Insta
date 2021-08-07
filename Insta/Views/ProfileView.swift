//
//  Profile.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            Button("Sign Out") {
                user.isSignedIn = false
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
