//
//  PhotoJournalModel.swift
//  PhotoJournal
//
//  Created by Ian Cervone on 10/7/19.
//  Copyright © 2019 Ian Cervone. All rights reserved.
//

import Foundation
import UIKit

struct PhotoJournalModel: Codable {
  let caption: String
  let photoData: Data
}
