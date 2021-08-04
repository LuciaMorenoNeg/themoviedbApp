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
   
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.original_title <- map["original_title"]
        self.poster_path <- map["poster_path"]
    }
    
    
    init(id: Int, original_title : String, poster_path: String){
        self.id = id
        self.original_title = original_title
        self.poster_path = poster_path
        
    }
    

}
