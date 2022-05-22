//
//  APIRouter.swift
//  Movies
//
//  Created by Arman on 23.05.2022.
//

import Alamofire

enum APIRouter {
    case getMovies(searchText: String)
    case getMovie(id: String)
}
