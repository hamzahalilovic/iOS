//
//  ViewController.swift
//  FlowerScan
//
//  Created by Hamza Halilovic on 12/08/2020.
//  Copyright © 2020 Hamza Halilovic. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage
import ColorThiefSwift

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    var pickedImage : UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //set user image
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("cannot convert UIImage into CIImage")
            }
            
            detect(image: ciImage)
            
            
            //set user picked image ito imageView with downcast
            //            imageView.image = userPickedImage
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage){
        
        //create vision container for the model
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("could not import model")
        }
        
        //crete request
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            //look for classified image
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("couldn't classify image")
            }
            
            //set identifier in navigation title
            self.navigationItem.title = classification.identifier.capitalized
            
            
            self.requestInfo(flowerName: classification.identifier)
            
        }
        
        //create handler to process the request
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
    }
    
    func requestInfo(flowerName: String) {
        
        let parameters : [String:String] = [
        "format" : "json",
        "action" : "query",
        "prop" : "extracts|pageimages",
        "exintro" : "",
        "explaintext" : "",
        "titles" : flowerName,
        "pithumbsize" : "500",
        "indexpageids" : "",
        "redirects" : "1",
        ]
           
           
         Alamofire.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
           if response.result.isSuccess {
                   //                print(response.request)
                   //
                   //                print("Success! Got the flower data")
                   let flowerJSON : JSON = JSON(response.result.value!)
                   
                   let pageid = flowerJSON["query"]["pageids"][0].stringValue
                   
                   let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
                   let flowerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                   
                   //                print("pageid \(pageid)")
                   //                print("flower Descript \(flowerDescription)")
                   //                print(flowerJSON)
                   //
            self.label.text = flowerDescription
                   
                   
                   
                   
                   self.imageView.sd_setImage(with: URL(string: flowerImageURL), completed: { (image, error,  cache, url) in
                       
                       if let currentImage = self.imageView.image {
                           
                           guard let dominantColor = ColorThief.getColor(from: currentImage) else {
                               fatalError("Can't get dominant color")
                           }
                           
                           
                           DispatchQueue.main.async {
                               self.navigationController?.navigationBar.isTranslucent = true
                               self.navigationController?.navigationBar.barTintColor = dominantColor.makeUIColor()
                               
                               
                           }
                       } else {
                           self.imageView.image = self.pickedImage
                           self.label.text = "cant get info from wikipedia"
                       }
                       
                   })
                   
               }
               else {
                   print("Error \(String(describing: response.result.error))")
                   self.label.text = "connection failure"
                   
                   
                   
               }
           }
       }
       
    
    
    
    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        
        //present controller
        present(self.imagePicker, animated: true, completion: nil)
        
    }
    
}

