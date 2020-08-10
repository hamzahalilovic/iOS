//
//  ImagePicker.swift
//  MoP-Memories
//
//  Created by Hamza Halilovic on 29/07/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


struct ImagePickerController: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) var presentationMode
    
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerController>) -> UIImagePickerController {
        
        //instantiate the UIImagePickerController and configure its initial state (configure its source type)
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        
        imagePicker.delegate = context.coordinator

        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerController>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePickerController
    
    //takes instance of ImagePicker so we can pass it the selected image
    init(_ parent: ImagePickerController) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parent.selectedImage = image
        }
        //dismiss the view
        parent.presentationMode.wrappedValue.dismiss()
        
    }
    
    

}



