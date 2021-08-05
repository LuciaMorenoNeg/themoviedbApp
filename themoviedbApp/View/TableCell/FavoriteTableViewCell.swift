//
//  FavoriteTableViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 4/8/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteMovieImage: UIImageView!
    static let identifier = "FavoriteTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FavoriteTableViewCell", bundle: nil)
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
