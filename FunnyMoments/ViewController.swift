//
//  ViewController.swift
//  FunnyMoments
//
//  Created by fork on 2019-09-28.
//  Copyright © 2019 fork. All rights reserved.
//

import UIKit
import AVFoundation
 
class ViewController: UIViewController{
    
    
    @IBOutlet weak var videoView: UIImageView!
    
    
    var videoPicker=UIImagePickerController()
    var videoURL: NSURL?
    
    
    @IBAction func importBtnTapped(_ sender: Any) {
//        videoPicker.allowsEditing = false
//        videoPicker.sourceType = .photoLibrary
//        videoPicker.delegate = self
//        videoPicker.mediaTypes = ["public.image", "public.movie"]
//
//        present(videoPicker, animated: true, completion: nil)
        
        func thumbnailImageFor(fileUrl:URL) -> UIImage? {

            let video = AVURLAsset(url: fileUrl, options: [:])
            let assetImgGenerate = AVAssetImageGenerator(asset: video)
            assetImgGenerate.appliesPreferredTrackTransform = true

            let videoDuration:CMTime = video.duration
            let durationInSeconds:Float64 = CMTimeGetSeconds(videoDuration)

            let numerator = Int64(1)
            let denominator = videoDuration.timescale
            let time = CMTimeMake(value: numerator, timescale: denominator)

            do {
                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                let thumbnail = UIImage(cgImage: img)
                return thumbnail
            } catch {
                print(error)
                return nil
            }
        }
        
        let url: URL = URL(string: "https://www.youtube.com/watch?v=fzQ6gRAEoy0")!

        let image: UIImage? = thumbnailImageFor(fileUrl: url)
        print("Image: \(image)")
        
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
