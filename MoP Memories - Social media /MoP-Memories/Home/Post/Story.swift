//
//  Story.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct Story : View {
    
    var imName = ""
    var user = ""
    @Binding var show : Bool
    @Binding var user1 : String
    @Binding var url : String
    
    var body : some View{
     
            
        VStack{
            AnimatedImage(url: URL(string: imName))
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .onTapGesture {
                    
                    self.user1 = self.user
                    self.url = self.imName
                    self.show.toggle()
                    
            }
            
            Text(user).fontWeight(.light)
            
        }
        
    }
}
