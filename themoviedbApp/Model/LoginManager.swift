//
//  LoginManager.swift
//  themoviedbApp
//
//  Created by Lucia Moreno on 4/8/21.
//

import Foundation

class LoginManager {
    
    static let instance: LoginManager = LoginManager()
    private var token = Token(map: <#Map#>)
    
    
    func getToken(onCompletation: @escaping (_ token: Token) ->()){
        APIClient.shared.requestItem(request: APIRouteOptions.requestToken, responseKey: "", onCompletion: {
            (result:Result<Token, Error>) in
            switch (result) {
            case .success(let token): self.token = token
                onCompletation(self.token!)
            case .failure(let error): print(error)
            }
        })
    }
    //validate token se le pasa username password request_token
    //solamente tenes que validar si es 200 o no
    
    
    func retrieveData(){
        
    }}
    
