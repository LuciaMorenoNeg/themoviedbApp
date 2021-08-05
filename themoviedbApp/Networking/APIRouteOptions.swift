//
//  APIRouteOptions.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 27/7/21.
//

import Foundation
import Alamofire

enum APIRouteOptions: APIRoute{
    case getGenres
    case moviesByGenre(genreId: Int)
    case login
    case requestToken
    case validateToken
    case movieDetails(movie_id: String)
    case movieByName(query: String)
    case makeFavorite(media_type: String, media_id: Int, favorite: Bool )
    case listFavorite
    
    var method : HTTPMethod { get {
        switch self{
            case .getGenres: return HTTPMethod.get
            case .moviesByGenre: return HTTPMethod.get
            case .login: return HTTPMethod.get
            case .requestToken: return HTTPMethod.get
            case .validateToken: return HTTPMethod.post
            case .movieDetails: return HTTPMethod.get
            case .movieByName: return HTTPMethod.get
            case .makeFavorite: return HTTPMethod.post
            case .listFavorite: return HTTPMethod.get
        }
     }
    }
    
    var sessionPolicy: APIRouteSessionPolicy { get {
        switch self{
            case .getGenres: return APIRouteSessionPolicy.publicDomain
            case .moviesByGenre: return APIRouteSessionPolicy.publicDomain
            case .login: return APIRouteSessionPolicy.publicDomain
            case .requestToken: return APIRouteSessionPolicy.publicDomain
            case .validateToken: return APIRouteSessionPolicy.publicDomain
            case .movieDetails: return APIRouteSessionPolicy.publicDomain
            case .movieByName: return APIRouteSessionPolicy.publicDomain
            case .makeFavorite: return APIRouteSessionPolicy.publicDomain
            case .listFavorite: return APIRouteSessionPolicy.publicDomain
        }
     }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self{
            case .getGenres: return  try encoded(path: "genre/movie/list", params: [:])
            case .moviesByGenre(genreId: let id): return try encoded(path: "discover/movie?with_genres=", params: ["with_genres" : id])
            case .login: return  try encoded(path: "authentication/session/new", params: [:])
            case .requestToken: return  try encoded(path: "authentication/token/new", params: [:])
            case .validateToken: return  try encoded(path: "/authentication/token/validate_with_login", params: [:])
            case .movieDetails(movie_id: let id): return try encoded(path: "movie/", params: ["movie_id" : id])
            case .movieByName(query: let query): return try encoded(path: "search/movie", params: ["query" : query])
            case .makeFavorite(media_type: let media_type, media_id: let media_id, favorite: let favorite): return try encoded(path: "/account/{account_id}/favorite", params: ["media_type" : media_type, "media_id" : media_id, "favorite" : favorite ])
            case .listFavorite: return  try encoded(path: "/account/{account_id}/favorite/movie", params: [:])
                
            
        }
    }
}

