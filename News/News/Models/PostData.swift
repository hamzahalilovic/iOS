//
//  PostData.swift
//  News
//
//  Created by Hamza Halilovic on 23/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
