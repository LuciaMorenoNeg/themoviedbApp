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
    let title: String
    let description: String!
    let genre: Genre

    
    init(map: Map) throws {
        self.id = try map.value(Keys.id.rawValue)
        self.title = try map.value(Keys.title.rawValue)
        self.description = try map.value(Keys.description.rawValue)
        self.genre = try map.value(Keys.genre.rawValue)
    }
    
    enum Keys: String {
        case id
        case title
        case description
        case genre
    }
}
