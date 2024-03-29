


import UIKit


class MovieController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddToListDelegate {
    
    func didAddToList(watched: Watched, listName: String) {
        watcheds.append(watched)
        mainTableView.reloadData()
    }
    
    var watcheds = [Watched]()
    
    let mainTableView: UITableView = {
        let maintv = UITableView()
        maintv.translatesAutoresizingMaskIntoConstraints = false
        maintv.tableFooterView = UIView()
        maintv.separatorColor = .white
        maintv.backgroundColor = .black
        return maintv
    }()
    
    let cellId = "cellId"
    
    private let headerInSections = [
        "  ",
        "Movies",
        "Tv Shows",
        "Collections",
        "  ",
        "  "
    ]
    
    let diffCell = "diffCell"
    let cle = "cle"
    let showCellId = "showCellId"
    let moviesCellId = "moviesCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.watcheds = CoreDataManager.shared.fetchWatched()
        mainTableView.reloadData()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        
        mainTableView.register(MoviesTableCell.self, forCellReuseIdentifier: moviesCellId)
        mainTableView.register(CollectionsTableCell.self, forCellReuseIdentifier: cellId)
        mainTableView.register(TopTableCell.self, forCellReuseIdentifier: diffCell)
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: cle)
        mainTableView.register(TVShowsTableCell.self, forCellReuseIdentifier: showCellId)
        
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAdd))
        navigationItem.title = "My library"
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        setupView()
        
    }
    
    @objc private func handleAdd() {
        print("Adding some movie to my list")
        
        let addMovieController = AddMovieController()        
        let navController = UINavigationController(rootViewController: addMovieController)
        addMovieController.addDelegate = self
        present(navController, animated: true, completion: nil)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerInSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else if section == 1 || section == 2 {
            return 30
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: diffCell, for: indexPath) as! TopTableCell
            cell.backgroundColor = .blue
            
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: moviesCellId, for: indexPath) as! MoviesTableCell
            
            return cell
        }
        
        else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CollectionsTableCell
            
            cell.backgroundColor = .brown
            
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: showCellId, for: indexPath) as! TVShowsTableCell
            
//            cell.backgroundColor = .green
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cle, for: indexPath)
        cell.textLabel?.text = "Shine"
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        else if indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 3 {
            return 150
        }
        
        return 30
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if section == 0 {
            return nil
        }
        else if section == 1 {
            
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
//            headerView.backgroundColor = UIColor.lightGray
            
            let title = UILabel()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = "Movies"
            title.textColor = .white
            headerView.addSubview(title)
            
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("See All", for: .normal)
            button.setTitleColor(.white, for: .normal)
            headerView.addSubview(button)
            
            button.addTarget(self, action: #selector(handleSeeAllMovies), for: .touchUpInside)
            
            var headerViews = Dictionary<String, UIView>()
            headerViews["title"] = title
            headerViews["button"] = button
            
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[title]-[button]-15-|", options: [], metrics: nil, views: headerViews))
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-|", options: [], metrics: nil, views: headerViews))
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]-|", options: [], metrics: nil, views: headerViews))
            
            return headerView
        }
        else if section == 2 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
            //            headerView.backgroundColor = UIColor.lightGray
            
            let title = UILabel()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = "Tv Shows"
            title.textColor = .white
            headerView.addSubview(title)
            
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("See All", for: .normal)
            button.setTitleColor(.white, for: .normal)
            headerView.addSubview(button)
            
            button.addTarget(self, action: #selector(handleSeeAllShows), for: .touchUpInside)
            
            var headerViews = Dictionary<String, UIView>()
            headerViews["title"] = title
            headerViews["button"] = button
            
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[title]-[button]-15-|", options: [], metrics: nil, views: headerViews))
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-|", options: [], metrics: nil, views: headerViews))
            headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]-|", options: [], metrics: nil, views: headerViews))
            
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let cell = cell as? MoviesTableCell {
                cell.moviesCollectionView.dataSource = self
                cell.moviesCollectionView.delegate = self
                cell.moviesCollectionView.reloadData()
                
//                CoreDataManager.shared.fetchWatched()
            }
        }
    }
    
    @objc private func handleSeeAllMovies() {
        
        print("Everything is working")
        
        let viewController = SeeAllController()
        let navController = UINavigationController(rootViewController: viewController)
        
        present(navController, animated: true, completion: nil)
    }
    @objc private func handleSeeAllShows() {
        
        print("Everything is working fine")
        
    }
    
    private func setupView() {
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        view.addSubview(mainTableView)
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

extension MovieController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watcheds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moviesCellId, for: indexPath) as! MovieCell
        
        cell.imageView.image = UIImage(named: "shazam")
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
    
        if cell!.isSelected {
            let viewcontroller = DetailMovieController()
            navigationController?.pushViewController(viewcontroller, animated: true)
        }
        
        
        
    }
    
}
