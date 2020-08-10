//
//  Data.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 28/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import Foundation
import SwiftUI


struct dataOne: Identifiable {
    
    var id : String
    var name : String?
    var image : String?
    var comments : String?
    var likes : String?
}


struct dataTwo : Identifiable {
    
    var id : String
    var name : String
    var image : String
}
