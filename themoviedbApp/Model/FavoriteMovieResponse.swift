//
//  FavoriteMovieResponse.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 5/8/21.
//

import Foundation
import ObjectMapper

class FavoriteMovieResponse: Mappable {
    var media_type: String!
    var media_id : Int!
    var favorite : Bool!
    
    required init?(map: Map) {
       
    }
    
    func mapping(map: Map) {
        self.media_type <- map["media_type"]
        self.media_id <- map["media_id"]
        self.favorite <- map["favorite"]
    }
}
