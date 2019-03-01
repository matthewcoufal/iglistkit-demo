//
//  DateCollectionViewCell.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    // MARK: - View vars
    var dateLabel: UILabel!
    
    // MARK: - Data vars
    var date: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dateLabel = UILabel()
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        dateLabel.numberOfLines = 1
        addSubview(dateLabel)
        
    }
    
    func setupConstraints() {
        
        dateLabel.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
    }
    
    func configure(with date: String) {
        self.date = date
        dateLabel.text = date
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
