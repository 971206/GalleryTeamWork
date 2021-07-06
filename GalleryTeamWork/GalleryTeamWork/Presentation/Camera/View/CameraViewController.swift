//
//  CameraViewController.swift
//  GalleryTeamWork
//
//  Created by Beqa Tabunidze on 06.07.21.
//

import UIKit

class CameraViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    enum ImageSource {
        
        case photoLibrary
        case camera
    }

    
    @IBOutlet weak var takePictureButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Helpers
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
            imageView.contentMode = .scaleToFill
            imageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func selectImageFrom(_ source: ImageSource) {
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func showAlertWith(title: String, message: String) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @IBAction func onTapTakePicture(_ sender: Any) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        
        selectImageFrom(.camera)
    }
    
    @IBAction func onTapSave(_ sender: Any) {
        
        guard let selectedImage = imageView.image else {
            
            print("Image not found!")
            
            showAlertWith(title: "You haven't taken picture yet!", message: "")
            
            return
        }
        
//        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = "\(UUID.init().uuidString).jpg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        if let data = selectedImage.jpegData(compressionQuality:  1.0),
          !FileManager.default.fileExists(atPath: fileURL.path) {
            
            do {
                
                try data.write(to: fileURL)
                
                showAlertWith(title: "Image saved!", message: "")
                
            } catch {
                
                showAlertWith(title: "Error!", message: "")
            }
        }
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        if let error = error {
            
            showAlertWith(title: "Save error", message: error.localizedDescription)
            
        } else {
            
            showAlertWith(title: "Saved!", message: "")
        }
    }
    
}

 extension CameraViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            
            print("Image not found!")
            return
        }
        
        imageView.image = selectedImage
    }
}
