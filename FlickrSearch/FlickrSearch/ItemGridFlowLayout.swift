

import UIKit

class ItemGridFlowLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {
   
    override init() {
        super.init()
        self.itemSize = CGSizeMake(145, 145)
        self.minimumLineSpacing = 10.0
        self.minimumInteritemSpacing = 10.0
        self.headerReferenceSize = CGSizeMake(320, 25)
        self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var numberOfItemsPerRow: Int = 3 {
        didSet {
            invalidateLayout()
        }
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        if let collectionView = self.collectionView {
            var newItemSize = itemSize
            
            let itemsPerRow = CGFloat(max(numberOfItemsPerRow, 1))
            
            let totalSpacing = minimumInteritemSpacing * (itemsPerRow - 1.0) + self.sectionInset.left + self.sectionInset.right;
            
            newItemSize.width = CGFloat(Int((collectionView.bounds.size.width - totalSpacing) / itemsPerRow))
            
            newItemSize.height = newItemSize.width
            
            itemSize = newItemSize
        }
    }
}
