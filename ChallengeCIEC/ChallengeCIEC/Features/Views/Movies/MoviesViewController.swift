//
//  MoviesViewController.swift
//  ChallengeCIEC
//
//  Created by Guilherme Camilo Rosa on 25/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    private var presenter = MoviesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollection(manager: self.presenter.manager)
        self.presenter.delegate = self
        self.presenter.fetchMovies()
    }
    
    private func setupCollection(manager: MoviesCollectionManager) {
        
        manager.collection = self.collection
        manager.delegate = self
        
        self.collection.dataSource = manager
        self.collection.delegate = manager
    }
    
    @IBAction func segmentedAction(_ sender: Any) {
        self.presenter.changeCategory(sender: segmented.selectedSegmentIndex)
    }
}

extension MoviesViewController: MoviesCollectionManagerProtocol {
    func collectionDidSelectItem(movie: Movie) {
        let vc = MovieDetailViewController(movie: movie)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MoviesViewController: MoviesPresenterDelegate {
    func didChangeCategory(category: MovieCategory) {
        self.labelTitle.text = category.rawValue
        self.presenter.fetchMovies()
    }
    
    func didUpdateCollectManager(manager: MoviesCollectionManager) {
        self.setupCollection(manager: manager)
    }
}
