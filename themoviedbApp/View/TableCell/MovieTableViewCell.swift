//
//  MovieTableViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(label: String){
        self.genreLabel.text = label
    }
}
