//
//  CollectionCell.swift
//  Watched
//
//  Created by Ali on 26.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    
    let collectionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.backgroundColor = .red
        image.layer.cornerRadius = 5
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionImage)
        collectionImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
