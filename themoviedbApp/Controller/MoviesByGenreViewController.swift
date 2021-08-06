//
//  MoviesByGenreViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//
import Foundation
import UIKit
import Kingfisher

class MoviesByGenreViewController: UIViewController {

    @IBOutlet weak var moviesByGenreTableView: UITableView!
    
    
    var movieManager: MovieManager = MovieManager.instance
    
    var genre: Genre = Genre.init(id: 16, name : "Animation")
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesByGenreTableView.delegate = self
        moviesByGenreTableView.dataSource = self
        moviesByGenreTableView.register(UINib(nibName: "MoviesByGenreTableViewCell", bundle: nil), forCellReuseIdentifier: "MoviesByGenreTableViewCell")
        movieManager.getMoviesByGenre(oneGenre: self.genre) { movies in
            self.movies = movies
    }
  
}
}
extension MoviesByGenreViewController: UITableViewDataSource {
                
        func tableView(_ movietableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return self.movies.count
        }
                
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell: MoviesByGenreTableViewCell = self.moviesByGenreTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell" ) as! MoviesByGenreTableViewCell
                    
                    return cell
            }
                
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 200.0
        }
}

extension MoviesByGenreViewController: UITableViewDelegate {
    
}

