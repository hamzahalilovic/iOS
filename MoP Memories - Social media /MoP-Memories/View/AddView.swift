//
//  AddView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 29/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    //declaring state to use button
    @State private var isShowingCamera = false
    @State private var isShowingLibrary = false
    
    var body: some View {
        
        VStack{
            
            NavigationLink(destination: CameraView(), isActive: $isShowingCamera){
                Button(action: {
                    self.isShowingCamera = true
                }){
                    
                    HStack {
                        
                        Image(systemName: "camera")
                            .font(.system(size: 20))
                        
                        Text("Capture Image")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
            NavigationLink(destination: ImagePickerView(), isActive: $isShowingLibrary){
                Button(action: {
                    self.isShowingLibrary = true
                }){

                    HStack {

                        Image(systemName: "photo")
                            .font(.system(size: 20))

                        Text("Choose from library")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
