//
//  SettingsViewController.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/6/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBAction func returnBarButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  
  
  @IBAction func scrollDirectionSlider(_ sender: UISlider) {
    let roundedValue = round(sender.value / step) * step
    sender.value = roundedValue
    
    switch sender.value == 1 {
    case true:
      darkMode = true
      darkModeSettings()
    case false:
      darkMode = false
      darkModeSettings()
    }
  }

  @IBAction func backgroundColorSlider(_ sender: UISlider) {
    let roundedValue = round(sender.value / step) * step
    sender.value = roundedValue
    
  }
  
  let step: Float = 1
  
  weak var delegate: SettingsDelegate?
  
  var darkMode: Bool = true
  
  

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
  func darkModeSettings() {
    switch darkMode {
    case true:
      delegate?.darkModeOn()
      self.view.backgroundColor = .black
    case false:
      delegate?.darkModeOff()
      self.view.backgroundColor = .gray
    }
  }
    

}

