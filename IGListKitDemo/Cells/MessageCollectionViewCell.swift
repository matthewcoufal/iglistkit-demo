//
//  MessageCollectionViewCell.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - View vars
    var bubble: UIView!
    
    // MARK: - Data vars
    var didSend: Bool!
    
    // MARK: - Constants
    let padding: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bubble = UIView()
        bubble.clipsToBounds = true
        addSubview(bubble)
        
    }
    
    
    
    func setupConstraints() {
        
        bubble.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75).inset(padding)
            make.centerY.equalToSuperview()
            if !didSend {
                make.left.equalToSuperview().offset(padding)
            } else {
                make.right.equalToSuperview().inset(padding)
            }
            make.height.equalToSuperview().inset(padding)
        }
        
    }
    
    func configure(didSend: Bool) {
        self.didSend = didSend
        bubble.backgroundColor = didSend ? .brightBlue : .brightOrange
        bubble.layer.cornerRadius = (frame.height - padding * 2) / 2
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
