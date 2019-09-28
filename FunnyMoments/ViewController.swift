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
    
    @IBAction func importBtnTapped(_ sender: Any) {
        videoPicker.sourceType = .photoLibrary
        videoPicker.allowsEditing = false
        present(videoPicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPicker.delegate = self
        
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        <#code#>
    }
}






