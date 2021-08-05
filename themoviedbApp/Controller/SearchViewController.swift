//
//  SearchViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var movieManager: MovieManager = MovieManager.instance
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        print("hola")
        super.viewDidLoad()
        searchBar.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        
    }
    func findMoviesForSearch(textQuery: String){
        self.movieManager.moviesByName(textQuery: textQuery) { moviesList in
            self.movies = moviesList
            self.searchTableView.reloadData()
    }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("searchText \(searchText)")
        findMoviesForSearch(textQuery: searchText)
        print(searchText)
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchResultTableViewCell = self.searchTableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell" ) as! SearchResultTableViewCell
        cell.searchLabel.text = self.movies[indexPath.row].original_title
        let urlString = self.movies[indexPath.row].poster_path
        let url = URL(string: urlString!)
        cell.searchImage.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
