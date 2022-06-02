//
//  MovieActionView.swift
//  Movies
//
//  Created by Abdurahim on 30.05.2022.
//

import UIKit

final class MovieActionView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var rateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.buttonBackgroundColor
        button.setTitle("Rate", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.buttonBackgroundColor
        button.setTitle("Share", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.cancelButtonBackgroundColor
        button.setTitle("Cancel", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    public func setupViews() {
        self.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0)
        self.addSubview(rateButton)
        self.addSubview(shareButton)
        self.addSubview(cancelButton)
        
        setupContraints()
    }
    
    private func setupContraints() {
        rateButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalTo(shareButton.snp.top)
            $0.height.equalTo(ScreenSize.screenHeight/13)
            $0.width.equalTo(ScreenSize.screenWidth-20)
        }
        
        shareButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalTo(cancelButton.snp.top)
            $0.height.equalTo(ScreenSize.screenHeight/13)
            $0.width.equalTo(ScreenSize.screenWidth-20)
        }

        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalTo(ScreenSize.screenHeight-2*ScreenSize.screenHeight/13-10)
            $0.height.equalTo(ScreenSize.screenHeight/13)
            $0.width.equalTo(ScreenSize.screenWidth-20)
        }
    }
}
