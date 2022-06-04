//
//  MovieDetailView.swift
//  Movies
//
//  Created by Abdurahim on 29.05.2022.
//

import UIKit
import SnapKit

final class MovieDetailView: UIView {
    weak var delegate: ActionButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFonts.movieDetailTitleFont
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = AppFonts.movieDetailReleaseDateFont
        return label
    }()
    
    private lazy var movieActionButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = AppColors.detailBackgroundColor
        
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = AppFonts.actionTitleFont
        
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    public func setMovie(movie: MovieModel) {
        movieImageView.image = movie.image
        movieTitleLabel.text = movie.title
        movieReleaseDateLabel.text = movie.releaseDate
    }
    
    private func setupViews() {
        self.backgroundColor = AppColors.detailBackgroundColor
        
        self.addSubview(movieImageView)
        self.addSubview(movieTitleLabel)
        self.addSubview(movieReleaseDateLabel)
        self.addSubview(movieActionButton)
        
        setupContraints()
    }
    
    private func setupContraints() {
        movieImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo((ScreenSize.screenWidth-50)*1.4)
            $0.width.equalTo(ScreenSize.screenWidth-50)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(movieImageView.snp.bottom).offset(30)
        }
        
        movieReleaseDateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(movieTitleLabel.snp.bottom)
        }
        
        movieActionButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25)
            $0.top.equalTo(movieReleaseDateLabel.snp.bottom).offset(20)
            $0.height.equalTo(ScreenSize.screenWidth/13)
            $0.width.equalTo(ScreenSize.screenWidth-50)
        }
    }
    
    @objc func actionButtonTapped(_ sender: UIButton!) {
        delegate?.actionButtonTapped(sender)
    }
}
