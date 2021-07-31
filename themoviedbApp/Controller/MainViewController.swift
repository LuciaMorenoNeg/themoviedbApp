//
//  MainViewController.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    private var genres:[Genre] = []
    private var error:String = ""

    @IBOutlet weak var movietableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movietableView.dataSource = self
        movietableView.delegate = self
        movietableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
   override func viewWillAppear(_ animated: Bool) {
        APIClient.shared.requestItems(request: APIRouteOptions.getGenres, responseKey: "", onCompletion: {
            (result:Result<[Genre], Error>) in
            switch result {
            case .success(let genre): self.genres = genre
            case .failure(let error): self.error = error.localizedDescription
            }
        })
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ movietableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MovieTableViewCell = self.movietableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell" ) as! MovieTableViewCell
        //aca lo que lleva la celda que es un genero y un listado de peliculas
        return cell
    }
}

extension MainViewController: UITableViewDelegate {}
