//
//  Genre.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 26/7/21.
//

import Foundation
import ObjectMapper

class Genre: Mappable {
    var id: Int!
    var name : String!
    
    required init?(map: Map) {
       
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
    }
    
    
    init(id: Int, name : String ){
        self.id = id
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getId() -> Int{
        return self.id
    }
}
