//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Abdurahim on 29.05.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController, ButtonDelegate {
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
    
    @objc func buttonTapped(_ sender: UIButton!) {
        let movieActionlVC = MovieActionViewController()
        present(movieActionlVC, animated: true)
    }
}
