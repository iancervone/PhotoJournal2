//
//  CollectionViewCell.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/6/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var cellNameLabel: UILabel!
  
  @IBOutlet weak var cellImageView: UIImageView!

  @IBOutlet weak var cellOptionsButton: UIButton!
  
  @IBAction func cellOptionsButtonClicked(_ sender: UIButton) {
    delegate?.showActionSheet(tag: sender.tag)
  }
  
  weak var delegate: PhotoCellDelegate?
  
}
