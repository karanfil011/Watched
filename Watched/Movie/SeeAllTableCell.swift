//
//  SeeAllTableCell.swift
//  Watched
//
//  Created by Ali on 07.12.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

class SeeAllTableCell: UITableViewCell {
    
    let moviePosterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        return image
    }()
    
    let movieName: UITextView = {
        let name = UITextView()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Shazam"
        name.textColor = .white
        name.font = UIFont.boldSystemFont(ofSize: 17)
        name.backgroundColor = .black
        name.isEditable = false
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(moviePosterImageView)
        moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalToConstant: 63).isActive = true
        
        addSubview(movieName)
        movieName.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieName.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 10).isActive = true
        movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        movieName.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
}
