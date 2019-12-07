//
//  MainTableCell.swift
//  Watched
//
//  Created by Ali on 30.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit


class CollectionsTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let mainCollectinoView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let movies = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movies.translatesAutoresizingMaskIntoConstraints = false
        return movies
    }()
    
    let cellId = "cellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        mainCollectinoView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
        setupView()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionCell
        

//        let shazam = UIImage(named: "shazam")
//        cell.collectionImage.image = shazam
        cell.backgroundColor = .green
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 130)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

    }
    
    private func setupView() {
        
        mainCollectinoView.delegate = self
        mainCollectinoView.dataSource = self

        addSubview(mainCollectinoView)
        mainCollectinoView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainCollectinoView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainCollectinoView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainCollectinoView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
