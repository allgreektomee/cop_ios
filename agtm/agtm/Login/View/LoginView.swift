//
//  LoginView.swift
//  agtm
//
//  Created by yujin on 2023/10/10.
//

import SwiftUI
import Combine

import AuthenticationServices

struct LoginView: View {
    @State private var idText = ""
    @State private var pwText = ""
    @State var tag: Int? = 0
    @FocusState private var isFocused: Bool
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(idText, text: $idText, prompt: Text("  아이디를 입력해주세요."))
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .focused($isFocused)
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: 45)
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                
                TextField(pwText, text: $pwText, prompt: Text("  비밀번호를 입력해주세요."))
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .focused($isFocused)
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: 45)
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)

                NavigationLink(destination: ContentView(), tag: 1, selection: self.$tag ) {
                    EmptyView()
                }
                
                
                                
                Button {
                    // login
                    self.loginViewModel.login(id: idText, pw: pwText)
                        .sink { completion in
                            // TODO: - 로그인 예외처리
                            print(completion)
                        } receiveValue: { response in
                            if response {
//                                self.tag = 1
                            }
                        }.store(in: &loginViewModel.cancellables)
                    
                    self.loginViewModel.getUserInfo(username: idText)
                        .sink { completion in
                            // TODO: - 로그인 예외처리
                            print(completion)
                        } receiveValue: { response in
                            if response {
                                self.tag = 1
                                // 이동
                                
                            }
                        }.store(in: &loginViewModel.cancellables)
                    
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.mainYellow)
                        .frame(width : UIScreen.main.bounds.width * 0.3, height:50)
                        .overlay {
                            Text("Login")
                                .foregroundColor(.gray800)
                                .font(.system(size: 16, weight: .regular))
                        }
//                        .padding(.top, 40)
                    
                }
                
                NavigationLink {
                    SignUpView()
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                        .underline()
                }
                .padding(.bottom, 5)
                
                Button {
                    // login
                    loginViewModel.getUserInfo(username: "우리오더")
                        .sink { completion in
                            // TODO: - 로그인 예외처리
                            print(completion)
                        } receiveValue: { response in
                            if response {
                                self.tag = 1
                            }
                        }.store(in: &loginViewModel.cancellables)
                    
                    self.loginViewModel.login(id: "우리오더", pw: "wfis1212")
                        .sink { completion in
                            // TODO: - 로그인 예외처리
                            print(completion)
                        } receiveValue: { response in
                            if response {
//                                self.tag = 1
                            }
                        }.store(in: &loginViewModel.cancellables)
                } label: {
                    Text("둘러보기")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14))
                        .underline()
                    
                }
                .padding(.bottom, 60)
                
//                Button {
//                    // 회원가입
//                } label: {
//                    Text("Sign Up")
//                        .foregroundColor(Color.gray800)
//                        .font(.system(size: 14))
//                        .underline()
//                }
//                .padding(.bottom, 60)
                
//                AppleSigninButton()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray800)
        }
        .background(Color.gray800)
    }
}

struct AppleSigninButton : View{
    var body: some View{
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result  {
                case .success(let authResults):
                    print("Apple Login Successful")
                    switch authResults.credential{
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                           // 계정 정보 가져오기
                            let UserIdentifier = appleIDCredential.user
                            let fullName = appleIDCredential.fullName
                            let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                            let email = appleIDCredential.email
                            let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                            let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )
        .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
        .cornerRadius(5)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
