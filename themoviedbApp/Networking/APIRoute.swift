//
//  APIRoute.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 26/7/21.
//

import Foundation
import Alamofire

enum APIRouteSessionPolicy {
    case privateDomain, publicDomain
}

let apiKey = ""

protocol APIRoute: URLRequestConvertible {
    var method: HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding { get }
    var sessionPolicy: APIRouteSessionPolicy { get }
}

extension APIRoute {
    var baseURL: String { "https://developers.themoviedb.org/3/" }
    
    var encoding: Alamofire.ParameterEncoding {
        switch self.method {
        case .get, .delete, .patch: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }

    func encoded(path: String, params: [String: Any]) throws -> URLRequest {
        let encodedPath = path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: baseURL + encodedPath)!)
        urlRequest.httpMethod = self.method.rawValue

        var params = params
        if sessionPolicy == .privateDomain {
            params["api_key"] = apiKey
        }
        
        return try self.encoding.encode(urlRequest, with: params)
    }
}
