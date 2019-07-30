//
//  MovieActorsCell.swift
//  ChallengeCIEC
//
//  Created by Guilherme C Rosa on 29/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import UIKit

class MovieActorsCell: UITableViewCell {

    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(credits: MovieCredits) {
        
        let builder = MovieDetailActorsCollectionBuilder(credits: credits)
        
        self.collection.dataSource = builder
        self.collection.delegate = builder
    }
    
}
