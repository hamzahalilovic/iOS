//
//  PostView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    var user: String? = ""
    var image: String? = ""
    var postImage: String? = ""
    var id: String = ""
    var likes: String? = ""
    var comments: String? = ""
    
    var body: some View{
        
        VStack(alignment: .leading, content: {
            
            HStack{
                if(image == nil) {
                    
                } else {
                    AnimatedImage(url: URL(string: image!)).resizable().frame(width:30, height: 30).clipShape(Circle())

                }
                Text(user ?? "")
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "gear").resizable().frame(width:15, height:15)
                }.foregroundColor(Color("darkAndLight"))
            }
            
            //IMAGE
            
            Image(image!).resizable().frame(height: 350)
            
            
            //REACTION BAR
            
            HStack{
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "heart").resizable().frame(width: 25, height: 25)
                }.foregroundColor(Color("darkAndLight"))
                
                Button(action: {
                    
                }) {
                    
                    
                    Image(systemName: "bubble.left").resizable().frame(width: 25, height: 25)
                }.foregroundColor(Color("darkAndLight"))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "bookmark").resizable().frame(width: 25, height: 25)
                }.foregroundColor(Color("darkAndLight"))
            }.padding(.top, 8)
            
            
            
            Text("\(likes ?? "0") Likes").padding(.top, 8)
            Text("View all \(comments ?? "0") comments")
            
        }).padding(8)
        
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
