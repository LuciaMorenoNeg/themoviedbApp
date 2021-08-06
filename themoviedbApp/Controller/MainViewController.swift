//
//  MainViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import Foundation
import Kingfisher
import UIKit

class MainViewController: UIViewController{
    
    var movieManager: MovieManager = MovieManager.instance
    
    var genreCollections: [UICollectionView: Int] = [:]
    var genreMovies: [Int: [Movie]] = [:]

    var movies: [Movie] = []
    var onlySomeMovies: [Movie] = []

    var genres: [Genre] = []
    
    @IBOutlet weak var movietableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        movietableView.delegate = self
        movietableView.dataSource = self
        movietableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        movieManager.loadInitialData { listGenres in
            self.genres = listGenres
            self.movietableView.reloadData()
            listGenres.forEach { genre in
               
                self.movieManager.getMoviesByGenre(oneGenre: genre) { moviesList in
                    self.movies = moviesList
                    let indexOfGenre = self.genres.firstIndex(where: {$0.name == genre.name})
                    let collections = (self.genreCollections as NSDictionary).allKeys(for: indexOfGenre!) as! [UICollectionView]
                    self.genreMovies[indexOfGenre!] = self.getSomeMovies(intMovies: 10, movies: self.movies)
                    for collection in collections{
                        collection.reloadData()
                    }
                    
                }
            }
        }
        
        
        }
    func getSomeMovies(intMovies: Int, movies: [Movie]) -> [Movie]{
        var moviesResponse : [Movie] = []
        for i in 0 ..< 10 {
            moviesResponse.append(self.movies[i])
        }
        return moviesResponse
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
        genreCollections[cell.movieCollectionView] = indexPath.row
        
        cell.movieCollectionView.dataSource = self
        cell.movieCollectionView.delegate = self
        
        cell.seeMoreCollectionViewCell.dataSource = self
        cell.seeMoreCollectionViewCell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let gendreIndex = self.genreCollections[collectionView] else { return 0 }
        var count : Int = 0
        if genreMovies[gendreIndex] != nil{
        count = genreMovies[gendreIndex]!.count
        }
        return (count + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 10  {
            let cellSeeMore = collectionView.dequeueReusableCell(withReuseIdentifier: SeeMoreCollectionViewCell.identifier, for: indexPath) as! SeeMoreCollectionViewCell
            return cellSeeMore
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as!
            MovieCollectionViewCell
        
        guard let genreIndex = self.genreCollections[collectionView] else{
            return cell
        }
        
        if (self.genreMovies[genreIndex] != nil){
            let urlString = "https://image.tmdb.org/t/p/w500" + (self.genreMovies[genreIndex]?[indexPath.row].poster_path)!
            let url = URL(string: urlString)
            cell.movieImage.kf.setImage(with: url)
        }
        return cell
    }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if indexPath.row == 10  {
        let viewController = MoviesByGenreViewController()
        navigationController?.pushViewController(viewController, animated: false)
        }
    }
    
}


