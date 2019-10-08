//
//  CollectionViewController.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/6/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

  @IBOutlet weak var photoCollectionView: UICollectionView!
  
  @IBAction func addPhotoBarButton(_ sender: UIBarButtonItem) {
  }
  
  
  
  var mode: Bool = true
  
  var photos = [PhotoJournalModel] () {
    didSet {
      self.photoCollectionView.reloadData()
    }
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      photoCollectionView.delegate = self
      photoCollectionView.dataSource = self
      loadDefaultSettings()
//      loadPhotos()
    }
  
  private func loadDefaultSettings() {
    if let userMode = UserDefaultsWrapper.wrapper.getMode() {
      mode = userMode
    }
    setUserSettings()
  }
  
  
 private func setUserSettings() {
    switch mode {
    case true:
      self.view.backgroundColor = .black
    case false:
      self.view.backgroundColor = .gray
    }
  }
  
  
  
  
  
 private func loadPhotos() {
    do {
      photos = try PhotoJounralPersistenceManager.manager.getJournal()
    } catch {
      print(error)
    }
  }

  

    
}



extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? CollectionViewCell else {
      fatalError("expecting CollectionViewCell but got a different type")
    }
    let photo = photos[indexPath.row]
    cell.cellImageView.image = UIImage(data: photo.photoData)
    cell.cellNameLabel.text = photo.caption
    return cell
  }
}




extension CollectionViewController: PhotoCellDelegate {
func showActionSheet(tag: Int) {
    let options = UIAlertController.init(title: "Options", message: "Pick an option", preferredStyle: .actionSheet)
  
    let shareAction = UIAlertAction.init(title: "Share", style: .default) { (action) in
        let photo = self.photos[tag]
    }
  
    let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { (action) in
        let photo = self.photos[tag]
    }
  
  let editAction = UIAlertAction.init(title: "Edit", style: .default) { (action) in
    let photo = self.photos[tag]
  }
  
    let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
    options.addAction(shareAction)
    options.addAction(deleteAction)
    options.addAction(editAction)
    options.addAction(cancelAction)
  }
}

extension CollectionViewController: SettingsDelegate {
  func darkModeOn() {
    self.view.backgroundColor = .black
  }
  
  func darkModeOff() {
    self.view.backgroundColor = .gray
  }
  
}


