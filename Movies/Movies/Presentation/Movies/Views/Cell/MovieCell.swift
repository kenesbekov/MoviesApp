//
//  MovieCell.swift
//  Movies
//
//  Created by Abdurahim on 23.05.2022.
//

import UIKit

final class MovieCell: UITableViewCell {
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
        label.font = AppFonts.movieCellTitleFont
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = AppFonts.movieCellReleaseDateFont
        return label
    }()
    
    public func setMovie(movie: MovieModel) {
        movieImageView.image = movie.image
        movieTitleLabel.text = movie.title
        movieReleaseDateLabel.text = movie.releaseDate
    }
    
    public func getMovieFromCell() -> MovieModel {
        var movie = MovieModel(image: UIImage(), title: String(), releaseDate: String())
        
        if let movieImage = movieImageView.image,
           let movieTitle = movieTitleLabel.text,
           let movieReleaseDate = movieReleaseDateLabel.text {
            movie = MovieModel(image: movieImage, title: movieTitle, releaseDate: movieReleaseDate)
            
        }
        
        return movie
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.contentView.backgroundColor = AppColors.mainBackgroundColor
        self.contentView.addSubview(movieImageView)
        self.contentView.addSubview(movieTitleLabel)
        self.contentView.addSubview(movieReleaseDateLabel)
        
        setupContraints()
    }
    
    private func setupContraints() {
        movieImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.height.equalTo(140)
            $0.width.equalTo(100)
        }
        
        movieTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(movieImageView.snp.trailing).offset(12)
            $0.top.equalToSuperview().offset(14)
        }
        
        movieReleaseDateLabel.snp.makeConstraints {
            $0.leading.equalTo(movieImageView.snp.trailing).offset(12)
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(14)
        }
    }
}
