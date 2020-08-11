//
//  ViewController.swift
//  FoodScan
//
//  Created by Hamza Halilovic on 11/08/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegate
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        
        
    }
    
    //delegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //get the image user picked
        //use downcast as? and optional binding if let
        //if this data can be downcasted into UIImage then execute code in {}
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           
            //display picture user picked in the UIImageView
                   imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
       
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

