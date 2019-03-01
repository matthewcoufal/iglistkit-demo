//
//  MessageSectionController.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import IGListKit

protocol MessageSectionControllerDelegate {
    
    func messageSectionControllerWasTapped()
    
}

class MessageSectionController: ListSectionController {
    
    // MARK: - Data vars
    var message: Message!
    
    // MARK: - Constants
    let cellHeight: CGFloat = 100
    
    init(message: Message) {
        self.message = message
    }
    
    // MARK: - ListSectionController overrides
    override func sizeForItem(at index: Int) -> CGSize {
        guard let containerSize = collectionContext?.containerSize else {
            return .zero
        }
        return CGSize(width: containerSize.width, height: cellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: MessageCollectionViewCell.self, for: self, at: index) as! MessageCollectionViewCell
        cell.configure(didSend: message.didSend)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        message = object as? Message
    }
    
}
