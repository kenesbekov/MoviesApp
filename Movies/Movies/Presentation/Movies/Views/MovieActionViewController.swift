//
//  MovieActionViewController.swift
//  Movies
//
//  Created by Abdurahim on 30.05.2022.
//

import UIKit

final class MovieActionViewController: UIViewController {
    let movieActionView: MovieActionView = {
        let view = MovieActionView(
            frame: CGRect(x: 10,
                          y: ScreenSize.screenHeight - ScreenSize.bottomSafeArea! - 250,
                          width: AppButtonSize.actionMovieButtonWidth,
                          height: 3*AppButtonSize.actionMovieButtonHeight
                         )
        )
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        view.addSubview(movieActionView)
    }
}
