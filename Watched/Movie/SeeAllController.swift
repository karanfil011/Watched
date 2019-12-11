//
//  SeeAllController.swift
//  Watched
//
//  Created by Ali on 07.12.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation
import UIKit

class SeeAllController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
        
        tableView.register(SeeAllTableCell.self, forCellReuseIdentifier: cellId)
        navigationItem.title = "All"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    }
    
    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SeeAllTableCell
        
        cell.movieName.text = "The journey of the amazing kid Shazam"
        cell.backgroundColor = .black
        cell.moviePosterImageView.image = UIImage(named: "shazam")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
