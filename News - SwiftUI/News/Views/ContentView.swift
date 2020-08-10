//
//  ContentView.swift
//  News
//
//  Created by Hamza Halilovic on 23/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url:post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
//
//let posts = [
//    Post(id: "1", title: "hi"),
//    Post(id: "2", title: "hi"),
//    Post(id: "3", title: "hi"),
//
//]
