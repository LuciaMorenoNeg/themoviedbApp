//
//  MainViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import Foundation
import Kingfisher
import UIKit

class MainViewController: UIViewController {
    
    var movieManager: MovieManager = MovieManager.instance
    
    var dicc: [UICollectionView: Int] = [:]
    var movies: [Movie] = []
    var genres: [Genre] = []
    
    @IBOutlet weak var movietableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movietableView.delegate = self
        movietableView.dataSource = self
        movietableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        movieManager.loadInitialData { listGenres in
            self.genres = listGenres
            listGenres.forEach { genre in
                self.movieManager.loadInitialDataMovies(oneGenre: genre) { moviesList in
                    self.movies = moviesList
                    self.movietableView.reloadData()
        }
    }
    }
}
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ movietableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = self.movietableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell" ) as! MovieTableViewCell
        var gendreName = "vacio"
        gendreName = self.genres[indexPath.row].name
        cell.configure(label: gendreName)
        dicc[cell.movieCollectionView] = indexPath.row
        cell.movieCollectionView.dataSource = self
        cell.movieCollectionView.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

extension MainViewController: UITableViewDelegate {}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let gendreIndex = dicc[collectionView] else { return 0 }
        return gendreIndex
        //busco en el diccionario el indice del genero y traego las movies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as!
            MovieCollectionViewCell
        let url = "https://image.tmdb.org/t/p/w500" + self.movies[indexPath.row].poster_path
        cell.movieImage.kf.setImage(with: url)
        return cell
    }
    
    
}
