//
//  MovieDetailActorsCollectionBuilder.swift
//  ChallengeCIEC
//
//  Created by Guilherme C Rosa on 30/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailActorsCollectionBuilder: NSObject {
    
    private var credits: MovieCredits
    
    init(credits: MovieCredits) {
        self.credits = credits
    }
}

extension MovieDetailActorsCollectionBuilder: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        guard let cast = self.credits.cast else { return 0 }
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let castList = self.credits.cast else { return UICollectionViewCell() }
        
        let properties = CollectionCellBuilderProperties(collection: collectionView, indexPath: indexPath)
        let cast = castList[indexPath.item]
        
        return MovieActorsCollectionCellBuilder(properties: properties, cast: cast).cell
    }
}
