//
//  HomeView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var observer = Observer()
    @ObservedObject var postobserver = postObserver()
    @State var show = false
    @State var user = ""
    @State var url = ""
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack{
                        
                        ForEach(observer.status){i in
                            
                            Story(imName: i.image, user: i.name, show: self.$show, user1: self.$user, url: self.$url).padding(.leading, 10)
                        }
                        
                    }.animation(.spring())
                }
                
                if postobserver.posts.isEmpty{
                    
                    Text("No Posts").fontWeight(.heavy)
                }
                else{
                    
                    ForEach(postobserver.posts){i in
                        
                        PostView(user: i.name, image: i.image, id: i.id, likes: i.likes, comments: i.comments)
                    }
                }
                
            }
            
        }.sheet(isPresented: $show) {
            
            StoryView(url: self.url,name: self.user)
        }
        
        
        
        
        
        
    }
    
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

