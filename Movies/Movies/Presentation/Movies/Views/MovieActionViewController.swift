//
//  MovieActionViewController.swift
//  Movies
//
//  Created by Abdurahim on 30.05.2022.
//

import UIKit

final class MovieActionViewController: UIViewController {
    var movieActionView = MovieActionView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        view.addSubview(movieActionView)
    }
}
