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
            
            //convert UIImage to CIImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("could not convert UIImage to CIImage")
            }
            
            //run ciimage through func detect() method
            detect(image: ciimage)
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
       
    }
    
    func detect(image: CIImage) {
        
        //gurad serves for if model == nil trigger else statement
        //VNCoreMLModel comes from Vision
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("loading CoreML model failed")
        }
        
        //vision CoreML request
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            //process results of request
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("model failed to process image")
            }
            
            //if successful
            print(results)
            
        }
        
        //handler to specify the image to classify
        //image comes from uiimage which is converted to ciimage which goes to func detect()
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }catch {
            print(error)
        }
        
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

