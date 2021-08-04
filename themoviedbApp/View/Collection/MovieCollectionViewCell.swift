//
//  MovieCollectionViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 4/8/21.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "MovieCollectionViewCell"
    
    @IBOutlet weak var movieImage: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
