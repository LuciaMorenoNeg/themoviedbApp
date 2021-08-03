//
//  MainViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    var movieManager: MovieManager = MovieManager.instance
    @IBOutlet weak var movietableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movietableView.delegate = self
        movietableView.dataSource = self
        movietableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        movietableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ movietableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieManager.genresShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = self.movietableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell" ) as! MovieTableViewCell
        cell.configure(label: movieManager.genresShow[indexPath.row].name, movies: movieManager.movies)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

extension MainViewController: UITableViewDelegate {}
