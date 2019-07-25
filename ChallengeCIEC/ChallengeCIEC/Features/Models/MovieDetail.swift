//
//  MovieDetail.swift
//  ChallengeCIEC
//
//  Created by Guilherme Camilo Rosa on 25/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let homepage: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case homepage = "homepage"
    }
}
