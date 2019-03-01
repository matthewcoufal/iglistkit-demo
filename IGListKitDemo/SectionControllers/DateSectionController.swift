//
//  DateSectionController.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import IGListKit

class DateSectionController: ListSectionController {
    
    // MARK: - Data vars
    var dateModel: DateModel!
    
    // MARK: - Constants
    let cellHeight: CGFloat = 35
    
    init(dateModel: DateModel) {
        self.dateModel = dateModel
    }
    
    // MARK: - ListSectionController overrides
    override func sizeForItem(at index: Int) -> CGSize {
        guard let containerSize = collectionContext?.containerSize else {
            return .zero
        }
        return CGSize(width: containerSize.width, height: cellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: DateCollectionViewCell.self, for: self, at: index) as! DateCollectionViewCell
        cell.configure(with: dateModel.date)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        dateModel = object as? DateModel
    }
    
}
