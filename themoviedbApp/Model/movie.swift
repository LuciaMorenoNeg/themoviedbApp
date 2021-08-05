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
   
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.original_title <- map["original_title"]
        self.poster_path <- map["poster_path"]
        self.genre_ids <- map["genre_ids"]
        self.origin_country <- map["origin_country"]
    }
    
    
    init(id: Int, original_title : String, poster_path: String, genre_ids: [Int], origin_country: String){
        self.id = id
        self.original_title = original_title
        self.poster_path = poster_path
        self.genre_ids = genre_ids
        self.origin_country = origin_country
        
    }
    
    
    

}
