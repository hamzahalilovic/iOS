//
//  DetailView.swift
//  News
//
//  Created by Hamza Halilovic on 23/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
