//
//  ViewController.swift
//  IGListKitDemo
//
//  Created by Matthew Coufal on 3/1/19.
//  Copyright © 2019 Two Tone Technologies LLC. All rights reserved.
//

import UIKit
import IGListKit

class MessagesViewController: UIViewController {
    
    // MARK: - View vars
    var collectionView: UICollectionView!
    var adapter: ListAdapter!
    
    // MARK: - Data vars
    var messages = [ListDiffable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Messages"
        
        messages = [
            Message(didSend: false, id: "1"),
            Message(didSend: true, id: "2"),
            DateModel(date: "Friday, March 1, 2019"),
            Message(didSend: true, id: "3"),
            Message(didSend: true, id: "4"),
            Message(didSend: false, id: "5"),
            DateModel(date: "Saturday, March 2, 2019")
        ]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        
        let updater = ListAdapterUpdater()
        adapter = ListAdapter(updater: updater, viewController: nil)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.adapter.performUpdates(animated: false, completion: nil)
        
    }


}

extension MessagesViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return messages
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Message {
            return MessageSectionController(message: object as! Message)
        }
        return DateSectionController(dateModel: object as! DateModel)
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

