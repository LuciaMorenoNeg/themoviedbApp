//
//  MovieCollectionViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    
    @IBOutlet weak var nameMovieLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(label: String){
        self.nameMovieLabel.text = label
    }

}
