//
//  ViewController.swift
//  FunnyMoments
//
//  Created by fork on 2019-09-28.
//  Copyright © 2019 fork. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController{
    
    
    @IBOutlet weak var videoView: UIImageView!
    
    
    var videoPicker=UIImagePickerController()
    var videoURL: NSURL?
    
    
    @IBAction func importBtnTapped(_ sender: Any) {
        videoPicker.allowsEditing = false
        videoPicker.sourceType = .photoLibrary
        videoPicker.delegate = self
        videoPicker.mediaTypes = ["public.image", "public.movie"]

        present(videoPicker, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPicker.delegate = self
        
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        videoView.image = selectedImage
        
        videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? NSURL
        print(videoURL)

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
    }
}
