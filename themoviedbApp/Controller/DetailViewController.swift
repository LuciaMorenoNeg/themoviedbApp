//
//  DetailViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var detailMovieImage: UIImageView!
    @IBOutlet weak var originCountry: UILabel!
    var movieManager: MovieManager = MovieManager.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var movie : Movie
        //self.movieManager.movieDetails(id: <#String#>){_ in }
        //self.titleMovie.text = movie.original_title
        //self.originCountry.text = movie.origin_country
    }
}
