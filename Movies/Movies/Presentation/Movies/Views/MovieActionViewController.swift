//
//  MovieActionViewController.swift
//  Movies
//
//  Created by Abdurahim on 30.05.2022.
//

import UIKit

final class MovieActionViewController: UIViewController, ActionMovieButtonDelegate {
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
        movieActionView.delegate = self
        view.addSubview(movieActionView)
    }
}

extension MovieActionViewController {
    func rateButtonTapped(_ sender: UIButton!) {}
    
    func shareButtonTapped(_ sender: UIButton!) {}
    
    func cancelButtonTapped(_ sender: UIButton!) {}
}
