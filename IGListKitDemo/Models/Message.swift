//
//  Message.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import UIKit
import IGListKit

class Message {
    
    var didSend: Bool
    var id: String
    
    init(didSend: Bool, id: String) {
        self.didSend = didSend
        self.id = id
    }
    
}

extension Message: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let message = object as? Message else { return false }
        return message.id == id
    }
    
}
