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
    let name: String

    
    init(map: Map) throws {
        self.id = try map.value(Keys.id.rawValue)
        self.name = try map.value(Keys.name.rawValue)
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    enum Keys: String {
        case id
        case name
    }
    
    func getName() -> String {
        return name
    }
    
    func getId() -> Int {
        return id
    }
}
