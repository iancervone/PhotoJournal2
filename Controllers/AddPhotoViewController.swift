//
//  AddPhotoViewController.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/6/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit
import Photos

class AddPhotoViewController: UIViewController {
  
  @IBOutlet weak var addPhotoImageView: UIImageView!
    
  @IBOutlet weak var addPhotoCaption: UITextField!
  
  @IBAction func addFromCamera(_ sender: UIBarButtonItem) {
    let imagePickerVC = UIImagePickerController()
    imagePickerVC.delegate = self
    imagePickerVC.sourceType = .photoLibrary
  
    present(imagePickerVC, animated: true, completion: nil)
  }
  
  @IBAction func addFromLibrary(_ sender: UIBarButtonItem) {
    let imagePickerVC = UIImagePickerController()
    imagePickerVC.delegate = self
    imagePickerVC.sourceType = .photoLibrary
    
    if libraryPermission {
      imagePickerVC.delegate = self
      present(imagePickerVC, animated: true, completion: nil)
    } else {
      let alertVC = UIAlertController(title: "No Access", message: "Camera access is required for this app", preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "Deny", style: .destructive, handler: nil))
      self.present(alertVC, animated: true, completion: nil)
      
      alertVC.addAction(UIAlertAction(title: "Give access", style: .default, handler: {(action) in
        self.libraryPermission = true
        self.present(imagePickerVC, animated: true, completion: nil)
      }))
    }
  }
  
  @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func savePressed(_ sender: UIBarButtonItem) {
    guard let image = addPhotoImageView.image else {
      print("no image")
      return
    }
    guard let imageData = image.jpegData(compressionQuality: 0.5) else {
      print("no image data")
      return
    }
    guard let caption = addPhotoCaption.text else {
      print("no caption")
      return
    }
    
    let journalEntry = PhotoJournalModel(caption: caption, photoData: imageData)

    try? PhotoJounralPersistenceManager.manager.saveJournal(photoJournal: journalEntry)
  }
  
  
  var libraryPermission = false
  
  var image = UIImage() {
    didSet {
      addPhotoImageView.image = image
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  //shoud this vvv be a private func?
  func checkLibraryPermission() {
    let status = PHPhotoLibrary.authorizationStatus()
    switch status {
    case .authorized:
      print(status)
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization({status in
        switch status {
        case . authorized:
          self.libraryPermission = true
          print(status)
        case .denied:
          self.libraryPermission = false
          print("denied")
        case .notDetermined:
          print("not determined")
        case .restricted:
          print("restricted")
        }
      })
    case .denied:
      let alertVC = UIAlertController(title: "Denied ", message: "Camera access is required for this app", preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "Okey Dokey", style: .default, handler: nil))
    case .restricted:
      print("restricted")
    }
  }
  
  
}


extension AddPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let image = info[.originalImage] as? UIImage else {
      return
    }
    self.image = image
    dismiss(animated: true, completion: nil)
  }
}


