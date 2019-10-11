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
  
  @IBOutlet weak var scrollDirectionSlider: UISlider!
  
  @IBAction func returnBarButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func backgroundColorSliderPressed(_ sender: UISlider) {
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

  @IBAction func scrollDirectionSliderPressed(_ sender: UISlider) {
    let roundedValue = round(sender.value / step) * step
    sender.value = roundedValue
    
    switch sender.value == 1 {
      case true:
        scrollVertical = true
        UserDefaultsWrapper.wrapper.store(scroll: scrollVertical)
      case false:
        scrollVertical = false
        UserDefaultsWrapper.wrapper.store(scroll: scrollVertical)
      }
    scrollDirectionSetting()
  }
  
  
  
  let step: Float = 1
    
  private var darkMode: Bool = true
  private var scrollVertical = true
  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
    }
  
  
  
  private func loadDefaults() {
     if let userMode = UserDefaultsWrapper.wrapper.getMode() {
       darkMode = userMode
     }
    if let userDirection = UserDefaultsWrapper.wrapper.getScroll() {
      scrollVertical = userDirection
    }
      darkModeSettings()
      scrollDirectionSetting()
   }
   
  
  
  private func darkModeSettings() {
    switch darkMode {
    case true:
      self.view.backgroundColor = .black
      backgroundColorSlider.value = 1
    case false:
      self.view.backgroundColor = .darkGray
      backgroundColorSlider.value = 0
    }
  }
   
  
  
   private func scrollDirectionSetting() {
      switch scrollVertical {
      case true:
        scrollDirectionSlider.value = 0
      case false:
        scrollDirectionSlider.value = 1
      }
    }

  
  
}

