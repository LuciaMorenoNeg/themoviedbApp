//
//  MoviesByGenreTableViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 5/8/21.
//

import UIKit

class MoviesByGenreTableViewCell: UITableViewCell {

    static let identifier = "MoviesByGenreTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MoviesByGenreTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
