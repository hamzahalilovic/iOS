//
//  StoryView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct StoryView : View {
    
    var url = ""
    var name = ""
    
    var body : some View{
        
        ZStack{
            
            AnimatedImage(url: URL(string: url)).resizable()
            
            VStack{
                
                HStack{
                    
                    Text(name).font(.headline).fontWeight(.heavy).padding()
                    Spacer()
                }
                Spacer()
            }
        }
        
    }
}
