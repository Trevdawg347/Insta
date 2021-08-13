//
//  ActivityView.swift
//  Insta
//
//  Created by Forrest Buhler on 8/6/21.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        NavigationView {
            Form {
                ForEach(1..<10) { _ in 
                    Text("Someone Liked your post")
                }
            }
            .navigationTitle("Activity")
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
