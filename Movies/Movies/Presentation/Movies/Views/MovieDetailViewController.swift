//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Abdurahim on 29.05.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController, ActionButtonDelegate, ActionMovieButtonDelegate {
    let scrollView = UIScrollView()
    let movieDetailView = MovieDetailView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.detailBackgroundColor
        setupViews()
    }
    
    private func setupViews(){
        movieDetailView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(movieDetailView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        movieDetailView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView)
            $0.leading.trailing.equalTo(view)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(scrollView)
        }
    }
}

extension MovieDetailViewController {
    func actionButtonTapped(_ sender: UIButton!) {
        let movieActionVC = MovieActionViewController()
        movieActionVC.movieActionView.delegate = self
        present(movieActionVC, animated: true)
    }
    
    func rateButtonTapped(_ sender: UIButton!) {}
    
    func shareButtonTapped(_ sender: UIButton!) {
        dismiss(animated: true)
        
        let movie = movieDetailView.getMovieFromDetails()
        
        let movieImage = movie.image
        let movieTitle = movie.title
        let movieReleaseDate = movie.releaseDate
        
        let shareSheetVC = UIActivityViewController(
            activityItems: [movieImage, movieTitle, movieReleaseDate],
            applicationActivities: nil
        )
        
        present(shareSheetVC, animated: true)
    }
    
    func cancelButtonTapped(_ sender: UIButton!) {
        dismiss(animated: true)
    }
}
