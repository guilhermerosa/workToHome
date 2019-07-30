//
//  MovieActorsCellBuilder.swift
//  ChallengeCIEC
//
//  Created by Guilherme C Rosa on 30/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import Foundation
import UIKit

class MovieActorsCellBuilder: TableCellBuilder {
    
    private var credits: MovieCredits?
    
    init(properties: TableCellBuilderProperties, credits: MovieCredits?) {
        super.init(properties: properties, identifier: "MovieActorsCell")
        self.credits = credits
    }
    
    override func getCell() -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.identifier,
                                                      for: self.indexPath) as! MovieActorsCell
        
        if let c = self.credits, self.state == MovieDetailTableBuilderState.SuccessWithCredits.rawValue {
            cell.setup(credits: c)
        }
        
        return cell
    }
    
    override func getHeight() -> CGFloat {
        if self.state == MovieDetailTableBuilderState.SuccessWithCredits.rawValue {
            return 180.0
        } else {
            return 0.0
        }
    }
}
