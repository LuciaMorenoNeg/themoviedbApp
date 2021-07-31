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
    case login

    var method : HTTPMethod { get {
        switch self{
            case .getGenres: return HTTPMethod.get
            case .login: return HTTPMethod.get
        }
     }
    }
    
    var sessionPolicy: APIRouteSessionPolicy { get {
        switch self{
            case .getGenres: return APIRouteSessionPolicy.publicDomain
            case .login: return APIRouteSessionPolicy.publicDomain
        }
     }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self{
            case .getGenres: return  try encoded(path: "genres/get-movie-list", params: [:])
            case .login: return  try encoded(path: "genres/get-movie-list", params: [:])
        }
    }
}

