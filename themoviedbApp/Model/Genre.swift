//
//  Genre.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 26/7/21.
//

import Foundation
import ObjectMapper

struct Genre: ImmutableMappable {
    
    let id: Int
    let title: String

    
    init(map: Map) throws {
        self.id = try map.value(Keys.id.rawValue)
        self.title = try map.value(Keys.title.rawValue)
    }
    
    enum Keys: String {
        case id
        case title
    }
}
