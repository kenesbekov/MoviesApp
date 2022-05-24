//
//  ViewController.swift
//  Movies
//
//  Created by Abdurahim on 23.05.2022.
//

import UIKit
import SnapKit

final class MoviesViewController: UIViewController {
    private lazy var appBackgroundColor = UIColor(red: 16/255, green: 16/255, blue: 17/255, alpha: 1)
    private lazy var searchController = UISearchController()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = appBackgroundColor
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.typeName)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViews()
    }
    
    private func setupNavigation() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Movies"
        navigationController?.navigationBar.barTintColor = appBackgroundColor
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = appBackgroundColor
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MoviesViewController: UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieList.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = MovieList.movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.typeName, for: indexPath) as! MovieCell
        
        cell.setMovie(movie: movie)
        
        return cell
    }
}

extension NSObject {
    static var typeName: String {
        String(describing: self)
    }
}
