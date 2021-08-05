//
//  MoviesByGenreViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//
import Foundation
import UIKit

import Foundation

class MoviesByGenreViewController : UIViewController {
    @IBOutlet weak var moviesByGenreTableView: UITableView!
    
       
            var movies: [Movie] = []
            override func viewDidLoad() {}
  
}

 extension MoviesByGenreViewController: UITableViewDataSource {
                
        func tableView(_ movietableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return self.movies.count
        }
                
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell: MoviesByGenreTableViewCell = self.moviesByGenreTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell" ) as! MoviesByGenreTableViewCell
                    
                    return cell
            }
                
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 200.0
        }
}

