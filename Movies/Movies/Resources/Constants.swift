//
//  Constants.swift
//  Movies
//
//  Created by Abdurahim on 30.05.2022.
//

import UIKit

struct AppColors {
    static let detailBackgroundColor = UIColor(red: 26/255, green: 27/255, blue: 28/255, alpha: 1)
    static let mainBackgroundColor = UIColor(red: 16/255, green: 16/255, blue: 17/255, alpha: 1)
    static let actionViewBackgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0)
    static let actionButtonBackgroundColor = UIColor(red: 26/255, green: 27/255, blue: 28/255, alpha: 1)
    static let cancelButtonBackgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
}

struct AppFonts {
    static let movieCellTitleFont = UIFont.boldSystemFont(ofSize: 20)
    static let movieCellReleaseDateFont = UIFont.boldSystemFont(ofSize: 18)
    
    static let movieDetailTitleFont = UIFont.boldSystemFont(ofSize: 20)
    static let movieDetailReleaseDateFont = UIFont.boldSystemFont(ofSize: 20)
    
    static let actionTitleFont = UIFont.boldSystemFont(ofSize: 15)
}

struct AppButtonSize {
    static let actionMovieButtonHeight = ScreenSize.screenHeight / 13
    static let actionMovieButtonWidth = ScreenSize.screenWidth - 20
}

struct ScreenSize {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}
