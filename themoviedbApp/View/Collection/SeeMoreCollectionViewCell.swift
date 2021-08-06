//
//  SeeMoreCollectionViewCell.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 4/8/21.
//

import UIKit

class SeeMoreCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var seeMoreButton: UIButton!
    
    
    static let identifier = "SeeMoreCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SeeMoreCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
