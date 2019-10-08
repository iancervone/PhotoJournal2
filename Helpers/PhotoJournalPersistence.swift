//
//  PhotoJournalPersistence.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/7/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation

struct PhotoJounralPersistenceManager {
  private init() {
  }
  static let manager = PhotoJounralPersistenceManager()
  private let persistenceHelper = PersistenceHelper<PhotoJournalModel>(fileName: "phototJournals.plist")
  
  func saveJournal(photoJournal: PhotoJournalModel) throws {
    try persistenceHelper.save(newElement: photoJournal)}


  func getJournal() throws -> [PhotoJournalModel] {
    return try persistenceHelper.getObjects()
}

}
