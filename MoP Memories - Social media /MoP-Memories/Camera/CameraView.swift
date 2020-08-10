//
//  CameraView.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 29/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    
       @State private var isShowPhotoLibrary = false
        @State private var image = UIImage()
        
        var body: some View {
            
            
            VStack{
                
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                Button(action: {
                    self.isShowPhotoLibrary = true
                }){
                    
                    HStack {
                        
                        Image(systemName: "camera")
                            .font(.system(size: 20))
                        
                        Text("Take photo")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
                
            }.sheet(isPresented: $isShowPhotoLibrary){
                ImagePickerController(selectedImage: self.$image, sourceType: .camera)
            }
            
            
        }
    }

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
