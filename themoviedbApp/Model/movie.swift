//
//  Movie.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 26/7/21.
//

import Foundation
import ObjectMapper

struct Movie: ImmutableMappable {
    
    let id: Int
    let original_title: String
   
    
    init(map: Map) throws {
        self.id = try map.value(Keys.id.rawValue)
        self.original_title = try map.value(Keys.original_title.rawValue)
    }
    
    init(id: Int, original_title: String) {
        self.id = id
        self.original_title = original_title
    }
    
    enum Keys: String {
        case id
        case original_title
    }
}
