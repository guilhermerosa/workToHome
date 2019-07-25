//
//  MoviesPresenter.swift
//  ChallengeCIEC
//
//  Created by Guilherme Camilo Rosa on 25/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesPresenterDelegate {
    func didChangeCategory(category: MovieCategory)
    func didUpdateCollectManager(manager: MoviesCollectionManager)
}

class MoviesPresenter {
    
    var delegate: MoviesPresenterDelegate?
    
    private(set) var category = MovieCategory.Upcoming
    private(set) var manager = MoviesCollectionManager(state: .Loading, movies: nil) {
        didSet { self.delegate?.didUpdateCollectManager(manager: self.manager) }
    }
    
    func changeCategory(sender: Int) {
        switch sender {
        case 0:
            self.category = .Upcoming
        case 1:
            self.category = .Popular
        default:
            break
        }
        
        self.delegate?.didChangeCategory(category: self.category)
    }
    
    func fetchMovies() {
        self.manager = MoviesCollectionManager(state: .Loading, movies: nil)
        
        let service = TheMovieDBService()
        service.getMovies(category: self.category) { (list, error) in
            if let err = error {
                self.manager = MoviesCollectionManager(state: .Error, error: err.localizedDescription)
            } else {
                if let movies = list {
                    if movies.isEmpty {
                        self.manager = MoviesCollectionManager(state: .Empty, error: "Empty List")
                    } else {
                        self.manager = MoviesCollectionManager(state: .Success, movies: movies)
                    }
                } else {
                    self.manager = MoviesCollectionManager(state: .Error, error: "Parsing Error")
                }
            }
        }
    }
}
