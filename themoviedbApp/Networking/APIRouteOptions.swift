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

    var method : HTTPMethod { get {
        switch self{
            case .getGenres: return HTTPMethod.get
            case .moviesByGenre: return HTTPMethod.get
            case .login: return HTTPMethod.get
            case .requestToken: return HTTPMethod.get
            case .validateToken: return HTTPMethod.post
            case .movieDetails: return HTTPMethod.get
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
        }
     }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self{
            case .getGenres: return  try encoded(path: "genre/movie/list", params: [:])
            case .moviesByGenre(genreId: let id): return try encoded(path: "discover/movie?with_genres=", params: ["with_genres" : id, "api_key": apiKey])
            case .login: return  try encoded(path: "authentication/session/new", params: ["api_key": apiKey])
            case .requestToken: return  try encoded(path: "authentication/token/new", params: ["api_key": apiKey])
            case .validateToken: return  try encoded(path: "/authentication/token/validate_with_login", params: ["api_key": apiKey])
            case .movieDetails(movie_id: let id): return try encoded(path: "/movie/", params: ["movie_id" : id, "api_key": apiKey])
            
        }
    }
}

