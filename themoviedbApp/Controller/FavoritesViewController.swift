//
//  FavoritesViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
import UIKit

class FavoritesViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    private var movies: [Movie] = []
    @IBOutlet weak var favoritesTableView: UITableView!
    var movieManager: MovieManager = MovieManager.instance
    
    override func viewDidLoad() {
        print("hola")
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableViewCell")
        self.movieManager.listFavorite { moviesList in
            self.movies = moviesList
            self.favoritesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoriteTableViewCell = self.favoritesTableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell" ) as! FavoriteTableViewCell
        let urlString = self.movies[indexPath.row].poster_path
        let url = URL(string: urlString!)
        cell.favoriteMovieImage.kf.setImage(with: url)
        return cell
    }
}
