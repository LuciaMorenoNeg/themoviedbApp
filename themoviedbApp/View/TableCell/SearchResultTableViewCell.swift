//
//  SearchResultTableViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 4/8/21.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    static let identifier = "SearchResultTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SearchResultTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
