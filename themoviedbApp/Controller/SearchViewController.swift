//
//  SearchViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movieManager: MovieManager = MovieManager.instance
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
            print("searchText \(searchText)")
        
        }
     func searchBarSearchButtonClicked(searchBar: UISearchBar) {
            print("searchText \(searchBar.text)")
            self.movieManager.moviesByName(textQuery: searchBar.text!) { moviesList in
                self.movies = moviesList
            }
        }
    
    func tableView(_ movietableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchResultTableViewCell = self.searchTableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell" ) as! SearchResultTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
