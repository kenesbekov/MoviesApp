//
//  ViewController.swift
//  Movies
//
//  Created by Abdurahim on 23.05.2022.
//

import UIKit
import SnapKit

final class MoviesViewController: UIViewController {
    private lazy var searchController = UISearchController()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = AppColors.mainBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.typeName)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViews()
    }
    
    private func setupNavigation() {
        navigationItem.title = "Movies"
        navigationController?.navigationBar.barTintColor = AppColors.mainBackgroundColor
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = AppColors.mainBackgroundColor
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieList.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = MovieList.movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.typeName, for: indexPath) as! MovieCell
        
        cell.setMovie(movie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        let cell = tableView.cellForRow(at: indexPath) as! MovieCell
        movieDetailVC.movieDetailView.setMovie(movie: cell.getMovieFromCell())
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension NSObject {
    static var typeName: String {
        String(describing: self)
    }
}
