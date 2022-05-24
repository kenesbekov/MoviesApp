//
//  MovieCell.swift
//  Movies
//
//  Created by Abdurahim on 23.05.2022.
//

import UIKit

final class MovieCell: UITableViewCell {
    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    public func setMovie(movie: Movie) {
        movieImageView.image = movie.image
        movieTitleLabel.text = movie.title
        movieReleaseDateLabel.text = movie.releaseDate
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.contentView.backgroundColor = UIColor(red: 16/255, green: 16/255, blue: 17/255, alpha: 1)
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