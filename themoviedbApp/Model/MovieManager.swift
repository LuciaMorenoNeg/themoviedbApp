//
//  MovieManager.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 2/8/21.
//

import Foundation
class MovieManager {
    private var listGenres:[Genre] = []
    private var genresShow:[Genre] = []
    private var movies:[Movie] = []
    private var error:String = ""
    
    static let instance: MovieManager = MovieManager()
    
    private init(){
        self.retrieveData()
    }
    
    func loadInitialData(onCompletation: @escaping (_ listGenres: [Genre]) ->() ) {
        APIClient.shared.requestItems(request: APIRouteOptions.getGenres, responseKey: "genres", onCompletion: {
            (result:Result<[Genre], Error>) in
            switch (result) {
            case .success(let genre): self.listGenres = genre
                self.genresShow = self.loadShowGenres(genres: self.listGenres)
                onCompletation(self.genresShow)
            case .failure(let error): print(error)
            }
        })
    }
    
    func loadShowGenres(genres: [Genre]) -> [Genre] {
        listGenres.forEach { genre in
            if genre.getName() == "Action" || genre.getName() == "Adventure" || genre.getName() == "Animation" || genre.getName() == "Family" || genre.getName() == "History" || genre.getName() == "Music" || genre.getName() == "Romance" || genre.getName() == "Comedy"{
                genresShow.append(genre)
            }
        }
        return genresShow
    }
    
    func loadInitialDataMovies(oneGenre: Genre, onCompletation: @escaping (_ moviesList: [Movie]) ->()) {
            APIClient.shared.requestItems(request: APIRouteOptions.moviesByGenre(genreId: oneGenre.getId()), responseKey: "results", onCompletion: {
                (result:Result<[Movie], Error>) in
                switch (result) {
                case .success(let movie): self.movies = movie
                    onCompletation(self.movies)
                case .failure(let error): print(error)
                }
            })
    }
    
    func getMovieDetails(id: String) -> Movie {
        APIClient.shared.requestItem(request: APIRouteOptions.movieDetails(movie_id: id), responseKey: "", onCompletion: {
            (result:Result<Movie, Error>) in
            switch result {
            case .success(let movie): self.movies.append(movie)
            case .failure(let error): self.error = error.localizedDescription
            }
        })
        return movies[0]
}
    
    func moviesByName(textQuery: String, onCompletation: @escaping (_ moviesList: [Movie]) ->()) {
            APIClient.shared.requestItems(request: APIRouteOptions.movieByName(query: textQuery), responseKey: "results", onCompletion: {
                (result:Result<[Movie], Error>) in
                switch (result) {
                case .success(let movie): self.movies = movie
                    onCompletation(self.movies)
                case .failure(let error): print(error)
                }
            })
    }
    func listFavorite(onCompletation: @escaping (_ moviesList: [Movie]) ->()) {
        APIClient.shared.requestItems(request: APIRouteOptions.listFavorite, responseKey: "results", onCompletion: {
            (result:Result<[Movie], Error>) in
            switch (result) {
            case .success(let movie): self.movies = movie
                onCompletation(self.movies)
            case .failure(let error): print(error)
            }
        })
}
    func movieDetails(id: String, onCompletation: @escaping (_ movies: Movie) ->()) {
        APIClient.shared.requestItem(request: APIRouteOptions.movieDetails(movie_id: id), responseKey: "", onCompletion: {
            (result:Result<Movie, Error>) in
            switch (result) {
            case .success(let movie): onCompletation(movie)
            case .failure(let error): print(error)
            }
        })
}
    
    func retrieveData(){
        
    }
    
}
