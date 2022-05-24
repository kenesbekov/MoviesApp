//
//  Movie.swift
//  Movies
//
//  Created by Abdurahim on 23.05.2022.
//

import Foundation
import UIKit

struct Movie {
    var image: UIImage
    var title: String
    var releaseDate: String
}

struct MovieList {
    static let movies = [Movie](repeating: Movie(image: UIImage(named: "interstellar")!, title: "Interstellar", releaseDate: "5 November 2014"), count: 10)
}
