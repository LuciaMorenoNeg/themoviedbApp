//
//  Movie.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 26/7/21.
//

import Foundation
import ObjectMapper

class Movie: Mappable {
    required init?(map: Map) {
    }
    
    var id: Int!
    var original_title: String!
    var poster_path : String!
    var genre_ids: [Int]!
    var origin_country : String!
    var vote_count : Int!
   
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.original_title <- map["original_title"]
        self.poster_path <- map["poster_path"]
        self.genre_ids <- map["genre_ids"]
        self.origin_country <- map["origin_country"]
        self.vote_count <- map["vote_count"]
        
    }
}
