//
//  TopTableCell.swift
//  Watched
//
//  Created by Ali on 30.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

class TopTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    let topCollectinoView: UICollectionView = {
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .red
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let topImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopCollectionCell
        cell.topImageView.image = UIImage(named: "topPoster")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 200)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        topCollectinoView.register(TopCollectionCell.self, forCellWithReuseIdentifier: cellId)
        
        topCollectinoView.delegate = self
        topCollectinoView.dataSource = self
        
        addSubview(topCollectinoView)
        topCollectinoView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topCollectinoView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topCollectinoView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topCollectinoView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
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
