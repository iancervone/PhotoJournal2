//
//  UserDefaults.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/8/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
  static let wrapper = UserDefaultsWrapper()
  
  
  
  private let modeKey = "mode"
  private let scrollKey = "scroll"

  
  
  func getMode() -> Bool? {
  return UserDefaults.standard.value(forKey: modeKey) as? Bool
  }
  
  func getScroll() -> Bool? {
    return UserDefaults.standard.value(forKey: scrollKey) as? Bool
  }
  
  
  
  func store(mode: Bool) {
    UserDefaults.standard.set(mode, forKey: modeKey)
  }
  
  func store(scroll: Bool) {
    UserDefaults.standard.set(scroll, forKey: scrollKey)
  }
  
}
