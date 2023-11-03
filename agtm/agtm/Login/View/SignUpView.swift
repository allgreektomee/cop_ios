//
//  SignUpView.swift
//  agtm
//
//  Created by yujin on 2023/10/13.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailText = ""
    @State private var nameText = ""
    @State private var pwText = ""
    @State private var pw2Text = ""
    @State var tag:Int? = nil
    @FocusState private var isFocused: Bool
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            
            NaviView(leftButton: ["back_arrow"],title: "",rightButton: "")
                .ignoresSafeArea()
            
            VStack {
                TextField(emailText, text: $emailText, prompt: Text("  이메일을 입력해주세요."))
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .focused($isFocused)
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: 45)
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                
                TextField(nameText, text: $nameText, prompt: Text("  아이디를 입력해주세요."))
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
                
                TextField(pw2Text, text: $pw2Text, prompt: Text("  비밀번호 확인"))
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
                    .focused($isFocused)
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: 45)
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                
                Spacer()
                
                NavigationLink(destination: ContentView(), tag: 2, selection: self.$tag ) {
                    EmptyView()
                }
                
                Button {
                    self.loginViewModel.signUp(email: emailText,
                                               username: nameText,
                                               pw: pwText,
                                               pw2: pw2Text)
                    .sink { completion in
                        // TODO: - 회원가입 예외처리
                        print(completion)
                    } receiveValue: { response in
                        if response {
                            self.loginViewModel.getUserInfo(username: nameText)
                                .sink { completion in
                                    print(completion)
                                } receiveValue: { response in
                                    if response {
                                        self.tag = 2
                                    }
                                }.store(in: &loginViewModel.cancellables)
                        }
                    }.store(in: &loginViewModel.cancellables)
                    
                } label: {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.mainYellow)
                        .frame(width : UIScreen.main.bounds.width * 0.3, height:50)
                        .overlay {
                            Text("Sign Up")
                                .foregroundColor(.gray800)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding(.top, 30)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .background(Color.gray800)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
