//
//  PhotoProtocols.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/7/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

//protocol PhotoCellDelegate: AnyObject {
//  func showActionSheet(tag: Int)
//}



protocol SettingsDelegate: AnyObject {
  func darkModeOn()
  func darkModeOff()
  func scrollVertical()
  func scrollHorizontal()
  
}
