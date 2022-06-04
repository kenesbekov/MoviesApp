//
//  Delegates.swift
//  Movies
//
//  Created by Abdurahim on 01.06.2022.
//

import UIKit

protocol ActionButtonDelegate: class {
    func actionButtonTapped(_ sender: UIButton!)
}

protocol ActionMovieButtonDelegate: class {
    func rateButtonTapped(_ sender: UIButton!)
    func shareButtonTapped(_ sender: UIButton!)
    func cancelButtonTapped(_ sender: UIButton!)
}
