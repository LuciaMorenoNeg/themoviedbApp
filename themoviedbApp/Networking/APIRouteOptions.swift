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
    

    var method : HTTPMethod { get {
        switch self{
        case .getGenres: return HTTPMethod.get
        case .moviesByGenre: return HTTPMethod.get
        case .login: return HTTPMethod.get
        }
     }
    }
    
    var sessionPolicy: APIRouteSessionPolicy { get {
        switch self{
        case .getGenres: return APIRouteSessionPolicy.publicDomain
        case .moviesByGenre: return APIRouteSessionPolicy.publicDomain
        case .login: return APIRouteSessionPolicy.publicDomain
        }
     }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self{
            case .getGenres: return  try encoded(path: "genre/movie/list?", params: ["api_key": apiKey])
        case .moviesByGenre(genreId: let id): return try encoded(path: "discover/movie?with_genres=", params: ["with_genres" : id, "api_key": apiKey])
            case .login: return  try encoded(path: "genres/get-movie-list", params: ["api_key": apiKey])
        }
    }
}

