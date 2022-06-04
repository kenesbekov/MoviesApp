//
//  MovieActionView.swift
//  Movies
//
//  Created by Abdurahim on 30.05.2022.
//

import UIKit

final class MovieActionView: UIView {
    weak var delegate: ActionMovieButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var rateButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = AppColors.actionButtonBackgroundColor

        button.setTitle("Rate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = AppFonts.actionTitleFont

        button.addTarget(self, action: #selector(rateButtonTapped), for: .touchUpInside)

        return button
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = AppColors.actionButtonBackgroundColor

        button.setTitle("Share", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = AppFonts.actionTitleFont

        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)

        return button
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = AppColors.cancelButtonBackgroundColor

        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = AppFonts.actionTitleFont

        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

        return button
    }()

    
    private func setupViews() {
        self.backgroundColor = AppColors.actionViewBackgroundColor
        self.addSubview(rateButton)
        self.addSubview(shareButton)
        self.addSubview(cancelButton)
        
        setupContraints()
    }
    
    private func setupContraints() {
        rateButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(shareButton.snp.top)
            $0.height.equalTo(AppButtonSize.actionMovieButtonHeight)
            $0.width.equalTo(AppButtonSize.actionMovieButtonWidth)
        }
        
        shareButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(cancelButton.snp.top)
            $0.height.equalTo(AppButtonSize.actionMovieButtonHeight)
            $0.width.equalTo(AppButtonSize.actionMovieButtonWidth)
        }

        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(AppButtonSize.actionMovieButtonHeight)
            $0.width.equalTo(AppButtonSize.actionMovieButtonWidth)
        }
    }
    
    @objc func rateButtonTapped(_ sender: UIButton!) {
        delegate?.rateButtonTapped(sender)
    }

    @objc func shareButtonTapped(_ sender: UIButton!) {
        delegate?.shareButtonTapped(sender)
    }

    @objc func cancelButtonTapped(_ sender: UIButton!) {
        delegate?.cancelButtonTapped(sender)
    }
}
