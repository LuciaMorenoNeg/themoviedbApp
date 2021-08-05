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
    var success: Bool!

    required init?(map: Map) {
       
    }
    
    func mapping(map: Map) {
        self.request_token <- map["request_token"]
        self.success <- map["success"]
    }
    
    init(request_token: Int, success : Bool ){
        self.request_token = request_token
        self.success = success
    }
}
