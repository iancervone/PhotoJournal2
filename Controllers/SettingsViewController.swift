//
//  SettingsViewController.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/6/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  
  @IBOutlet weak var backgroundColorSlider: UISlider!
  
  @IBAction func returnBarButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func scrollDirectionSliderPressed(_ sender: UISlider) {
    let roundedValue = round(sender.value / step) * step
    sender.value = roundedValue
    
    switch sender.value == 1 {
    case true:
      darkMode = true
      UserDefaultsWrapper.wrapper.store(mode: darkMode)
      darkModeSettings()
    case false:
      darkMode = false
      UserDefaultsWrapper.wrapper.store(mode: darkMode)
      darkModeSettings()
    }
  }

  @IBAction func backgroundColorSliderPressed(_ sender: UISlider) {
    let roundedValue = round(sender.value / step) * step
    sender.value = roundedValue
    
  }
  
  let step: Float = 1
  
//  weak var delegate: SettingsDelegate?
  
  var darkMode: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
    }
  
  
  
  private func loadDefaults() {
     if let userMode = UserDefaultsWrapper.wrapper.getMode() {
       darkMode = userMode
     }
     darkModeSettings()
   }
   
   
//  private func setUserSettings() {
//     switch mode {
//     case true:
//       self.view.backgroundColor = .black
//     case false:
//       self.view.backgroundColor = .gray
//     }
//   }
  
  
  
  
  
  func darkModeSettings() {
    switch darkMode {
    case true:
//      delegate?.darkModeOn()
      self.view.backgroundColor = .black
      backgroundColorSlider.value = 1
    case false:
//      delegate?.darkModeOff()
      self.view.backgroundColor = .gray
      backgroundColorSlider.value = 0
    }
  }
    

}

