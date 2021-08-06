//
//  SearchViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
import UIKit
import Kingfisher

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var movieManager: MovieManager = MovieManager.instance
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchResultTableViewCell")
        self.movieManager.moviesByName(textQuery: "a") { moviesList in
            self.movies = moviesList
            self.searchTableView.reloadData()
        }
        
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
        cell.raitingLabel.text = "Puntuada por: " + String(self.movies[indexPath.row].vote_count) + " visitantes" 
        if self.movies[indexPath.row].poster_path != nil{
            let urlString =  "https://image.tmdb.org/t/p/w500" + self.movies[indexPath.row].poster_path
                let url = URL(string: urlString)
                cell.searchImage.kf.setImage(with: url)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
