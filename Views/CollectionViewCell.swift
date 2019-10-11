//
//  CollectionViewCell.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/6/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

protocol PhotoCellDelegate: AnyObject {
  func showActionSheet(tag: Int)
}

class CollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var cellNameLabel: UILabel!
  
  @IBOutlet weak var cellImageView: UIImageView!

  @IBOutlet weak var cellOptionsButton: UIButton!
  
  weak var delegate: PhotoCellDelegate?
  
  @IBAction func cellOptionsButtonTapped(_ sender: UIButton) {
    delegate?.showActionSheet(tag: sender.tag)
    print("Hi")
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.contentView.isUserInteractionEnabled = true

  }
}
