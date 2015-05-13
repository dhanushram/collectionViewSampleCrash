//
//  ItemListFlowLayout.swift
//  Sortly
//
//  Created by Ramsundar Shandilya on 1/18/15.
//  Copyright (c) 2015 Sortly Inc. All rights reserved.
//

import UIKit

class ItemListFlowLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {
    
    override init() {
        super.init()
        self.itemSize = CGSizeMake(320, 80)
        self.minimumLineSpacing = 0.0
        self.minimumInteritemSpacing = 0.0
        self.headerReferenceSize = CGSizeMake(320, 25)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        if let collectionView = self.collectionView {
            var newItemSize = itemSize
            
            newItemSize.width = collectionView.bounds.size.width
            
            itemSize = newItemSize
        }
    }
    
}