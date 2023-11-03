//
//  LoginViewModel.swift
//  agtm
//
//  Created by yujin on 2023/10/10.
//

import SwiftUI
import Combine

import Moya

class LoginViewModel : ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    

    func login(id: String, pw: String) -> AnyPublisher<Bool, Error> {
        provider.requestPublisher(.login(LoginData(username: id, password: pw)))
            .tryMap { response in
                return true
            }
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
    func signUp(email: String, username: String, pw: String, pw2: String) -> AnyPublisher<Bool, Error>{
        provider.requestPublisher(.signUp(SignUpData(email: email, username: username, password: pw, password2: pw2)))
            .tryMap { response in
                return true
            }
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
    
    func getUserInfo(username: String) -> AnyPublisher<Bool, Error> {
        provider.requestPublisher(.getUserInfo(name: username))
            .tryMap { response in
                guard let responseData = try? response.map(Profile.self) else {
                    return false
                }
                Common.shared.loginInfo = responseData
                Common.shared.loginID = responseData.username
                return true
            }
            .mapError { error in
                return error
            }
            .eraseToAnyPublisher()
    }
}
