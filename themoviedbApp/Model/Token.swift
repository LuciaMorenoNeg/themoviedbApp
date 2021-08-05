//
//  Token.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 5/8/21.
//
import ObjectMapper
import Foundation

class Token: Mappable {
    var request_token: Int!

    required init?(map: Map) {
       
    }
    
    func mapping(map: Map) {
        self.request_token <- map["request_token"]
    }
}
