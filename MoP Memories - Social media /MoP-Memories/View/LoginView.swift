//
//  LoginView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        HStack {
            NavigationView{
              
                
            
                    
                    VStack{
                        
                    
                        Image("mop-logo").resizable().frame(width: 300, height: 300)
                        
                        Text("here you can login")
                        
                        
                            NavigationLink(destination: ContentView()){
                    google().frame(width:240, height: 100)
                        
                    
                    }
                }
            }
            
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

