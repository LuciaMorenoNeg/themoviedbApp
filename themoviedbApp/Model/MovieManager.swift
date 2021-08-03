//
//  MovieManager.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
class MovieManager {
    private var genres:[Genre] = []
    public var genresShow:[Genre] = []
    public var movies:[Movie] = []
    private var error:String = ""
    
    static let instance: MovieManager = MovieManager()
    
    private init(){
        self.retrieveData()
    }
    
    func loadInitialData(oncompletion: @escaping (_ error: Error?)->()) {
        APIClient.shared.requestItems(request: APIRouteOptions.getGenres, responseKey: "", onCompletion: {
            (result:Result<[Genre], Error>) in
            switch result {
            case .success(let genre): self.genres = genre
            case .failure(let error): self.error = error.localizedDescription
            }
        })
    
        genres.forEach { genre in
            if genre.getName() == "Action" || genre.getName() == "Adventure" || genre.getName() == "Animation" || genre.getName() == "Family" || genre.getName() == "History" || genre.getName() == "Music" || genre.getName() == "Romance" || genre.getName() == "Comedy"{
                genresShow.append(genre)
            }
        }
        genresShow.forEach { genre in
                APIClient.shared.requestItems(request: APIRouteOptions.moviesByGenre(genreId: genre.getId()), responseKey: "", onCompletion: {
                (result:Result<[Movie], Error>) in
                switch result {
                case .success(let movie): self.movies = movie
                case .failure(let error): self.error = error.localizedDescription
                }
            })
        }
    }
    
    func retrieveData(){
        
    }
}
