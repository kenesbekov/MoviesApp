//
//  MovieModel.swift
//  Movies
//
//  Created by Abdurahim on 23.05.2022.
//

import Foundation
import UIKit

struct MovieModel {
    var image: UIImage
    var title: String
    var releaseDate: String
}

struct MovieListModel {
    static let movies = [MovieModel](repeating: MovieModel(image: UIImage(named: "interstellar")!, title: "Interstellar", releaseDate: "5 November 2014"), count: 10)
}
