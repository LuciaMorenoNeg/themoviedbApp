//
//  MovieTableViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    static let identifier = "MovieTableViewCell"
    private var movies:[Movie] = []
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*movieCollectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(label: String, movies: [Movie]){
        self.genreLabel.text = label
        self.movies = movies
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as!
            MovieCollectionViewCell
        cell.configure(label: movies[indexPath.row].original_title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}
