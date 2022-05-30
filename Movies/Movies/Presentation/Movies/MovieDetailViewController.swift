//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Abdurahim on 29.05.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    private lazy var detailBackgroundColor = UIColor(red: 26/255, green: 27/255, blue: 28/255, alpha: 1)
    private lazy var screenWidth = UIScreen.main.bounds.size.width
    
    let scrollView = UIScrollView()
    let movieDetailView = MovieDetailView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = detailBackgroundColor
        setupViews()
    }
    
    private func setupViews(){
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
