//
//  ContentView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    
    
    var body: some View {
        
        
        TabView{
            
            NavigationView{
                HomeView()
                    .navigationBarTitle("MoP Memories")
                    .navigationBarItems(leading: Button(action: {
                        
                    }, label: {
                        
                        Image(systemName: "camera").resizable()
                        
                    }).foregroundColor(Color("darkAndLight"))
                        
                        , trailing:
                        HStack{
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "message").resizable()
                            }).foregroundColor(Color("darkAndLight"))
                        }
                )
                
                
            }.tabItem {
                
                Image(systemName: "house")
                
            }
            
            
            SearchView().tabItem {
                
                Image(systemName: "magnifyingglass")
            }
            
            AddView().tabItem {
                Image(systemName: "plus.circle")
            }
            
            NotificationView().tabItem {
                Image(systemName: "bell")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person")
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
