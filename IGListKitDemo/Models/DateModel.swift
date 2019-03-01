//
//  Date.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import UIKit
import IGListKit

class DateModel {
    
    var date: String
    
    init(date: String) {
        self.date = date
    }
    
}

extension DateModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return date as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let dateModel = object as? DateModel else { return false }
        return dateModel.date == date
    }
    
}
