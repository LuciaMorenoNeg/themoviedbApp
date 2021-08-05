//
//  MovieTableViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    @IBOutlet weak var seeMoreCollectionViewCell: UICollectionView!
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
        seeMoreCollectionViewCell.register(SeeMoreCollectionViewCell.nib(),forCellWithReuseIdentifier: SeeMoreCollectionViewCell.identifier)
        seeMoreCollectionViewCell.delegate = self
        seeMoreCollectionViewCell.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        
        let cellSeeMore = collectionView.dequeueReusableCell(withReuseIdentifier: SeeMoreCollectionViewCell.identifier, for: indexPath) as! SeeMoreCollectionViewCell
        if collectionView == self.movieCollectionView {
            return cell
        }else{
            return cellSeeMore
        }
    }
    
    func configure(label: String){
        self.genreLabel.text = label
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    
}
