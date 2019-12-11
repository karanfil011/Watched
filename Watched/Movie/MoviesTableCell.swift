//
//  TvShowsTableCell.swift
//  Watched
//
//  Created by Ali on 03.12.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

protocol PresentToAnotherView {
    func presentToViewController()
}

protocol AddWatchedToSelectedListDelegate {
    func didAddSelectedList(indx: IndexPath)
}

class MoviesTableCell: UITableViewCell{
    

    
    let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let showscv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        showscv.translatesAutoresizingMaskIntoConstraints = false
        return showscv
    }()
    
    let moviesCellId = "moviesCellId"
    
    var delegate: PresentToAnotherView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setuoView()
        
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: moviesCellId)
//        moviesCollectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//
//        cell.backgroundColor = .blue
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 90, height: 130)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        if cell!.isSelected {
//            delegate?.presentToViewController()
//        }
//
//
//    }
    
    private func setuoView() {
//        moviesCollectionView.delegate = self
//        moviesCollectionView.dataSource = self
        
        
        addSubview(moviesCollectionView)
        moviesCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        moviesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
}
