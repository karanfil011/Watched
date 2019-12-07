//
//  TopCollectionCell.swift
//  Watched
//
//  Created by Ali on 26.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

class TopCollectionCell: UICollectionViewCell {
    
    let topImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(topImageView)
        topImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
