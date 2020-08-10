//
//  ProfileView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        NavigationLink(destination: LoginView()){
        Text("Log out")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
