//
//  TvShowsTableCell.swift
//  Watched
//
//  Created by Ali on 03.12.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

class TVShowsTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let tvShowsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let showscv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        showscv.translatesAutoresizingMaskIntoConstraints = false
        return showscv
    }()
    
    let cellId = "cellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setuoView()
        
        tvShowsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 130)
    }
    
    private func setuoView() {
        tvShowsCollectionView.delegate = self
        tvShowsCollectionView.dataSource = self
        
        addSubview(tvShowsCollectionView)
        tvShowsCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tvShowsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tvShowsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tvShowsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    
}
