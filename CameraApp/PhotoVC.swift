//
//  PhotoVC.swift
//  CameraApp
//
//  Created by WjdanMo on 04/12/2021.
//

import Foundation
import UIKit

class PhotoVC : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    let name = UILabel()
    let imageView = UIImageView()
    let takeAPicture = UIButton()
    let cameraView = UIImagePickerController()
    let savePicture = UIButton()
    var passedName = ""
    
    let saveAPicture = UIButton(frame: CGRect(x: 90, y: 730, width: 200, height: 40))
    
    init(name: String){
        self.passedName = "\(name)'s Photo"
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        setupObjects()
    
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = pickedImage
            savePicture.isHidden = false
            picker.dismiss(animated: true, completion: nil)
            
        } else {
            print("Error")
        }
    }
    
    @objc func openCamera(){
        cameraView.delegate = self
        cameraView.sourceType = .camera
        cameraView.allowsEditing = false
        cameraView.showsCameraControls = true
        self.present(cameraView, animated: true, completion: nil)
    }
    
    @objc func save(_ sender: AnyObject) {
        guard let selectedImage = imageView.image else {
            print("Image not found!")
            return
        }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    @objc func image(_ imagee: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        if let error = error{
            let ac = UIAlertController(title: "Error while saving", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Success!", message: "The Image has been saved successfully", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    
    func setupObjects(){
        
        name.text = passedName
        name.textColor = .black
        name.frame = CGRect(x: 38, y: 80, width: 300, height: 30)
        name.textAlignment = .center
        name.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        view.addSubview(name)
        
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 18, y: 140, width: 340, height: 480)
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(named: "No photos yet")
        //        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        takeAPicture.setTitle("Take A Picture", for: .normal)
        takeAPicture.setTitleColor(UIColor.white, for: .normal)
        takeAPicture.backgroundColor = #colorLiteral(red: 0.2056434453, green: 0.5644673109, blue: 0.8626580834, alpha: 1)
        takeAPicture.frame = CGRect(x: 90, y: 640, width: 200, height: 40)
        takeAPicture.layer.cornerRadius = 20
        takeAPicture.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        view.addSubview(takeAPicture)
        
        savePicture.setTitle("Save to your camera roll ", for: .normal)
        savePicture.backgroundColor = #colorLiteral(red: 0.9119984508, green: 0.9065770507, blue: 0.9161657691, alpha: 0.8980392157)
        savePicture.setTitleColor(.black, for: .normal)
        savePicture.frame = CGRect(x: 60, y: 690, width: 260, height: 40)
        savePicture.layer.cornerRadius = 20
        savePicture.addTarget(self, action: #selector(save), for: .touchUpInside)
        savePicture.isHidden = true
        view.addSubview(savePicture)
        
    }
    
}
