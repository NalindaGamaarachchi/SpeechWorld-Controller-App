//
//  LoginService.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 23/2/2023.
//

import Combine
import Foundation
import Firebase

protocol LoginService {
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error>
}

struct LoginCredentials {
    var email: String
    var password: String
}

final class LoginServiceImpl: LoginService {
    
    func login(with credentials: LoginCredentials) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth
                    .auth()
                    .signIn(withEmail: credentials.email,
                            password: credentials.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

