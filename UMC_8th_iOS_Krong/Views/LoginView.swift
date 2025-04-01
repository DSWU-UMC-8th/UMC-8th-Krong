//
//  LoginView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/23/25.
//

import SwiftUI

enum loginField {
    case id
    case pwd
}

struct LoginView: View {
    var body: some View {
        VStack{
            Spacer()
            startGroup
            Spacer()
            loginGroup
            Spacer()
            socialLoginGroup
            Spacer()
        }
        .padding(.horizontal, 19)
    }
    
    private var startGroup: some View{
        HStack{
            VStack(alignment:.leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 97, height: 95)
                    .padding(.bottom, 5)
                Text("안녕하세요.")
                    .font(.mainTextExtraBold24)
                Text("스타벅스입니다.")
                    .font(.mainTextExtraBold24)
                    .padding(.bottom, 3)
                Text("회원 서비스 이용을 위해 로그인 해주세요.")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color("InfoGray"))
            }
            Spacer()
        }
    }
    
    @State var ViewModel: LoginViewModel = LoginViewModel()
    @FocusState var focusField: loginField?
    🙌🏻
    private var loginGroup: some View{
        
        VStack(alignment:.leading){
            TextField("아이디", text: $ViewModel.id)
                .font(.mainTextRegular13)
                .foregroundStyle(Color("black01"))
                .focused($focusField, equals: .id)
            Divider()
                .background(focusField == .id ? Color("starbucksGreen") : Color("infoGray"))
                .frame(height: 2)
                .padding(.bottom, 40)
                
            SecureField("비밀번호", text: $ViewModel.pwd)
                .font(.mainTextRegular13)
                .foregroundStyle(Color("black01"))
                .focused($focusField, equals: .pwd)
            Divider()
                .background(focusField == .pwd ? Color("green01") : Color("infoGray"))
                .padding(.bottom, 47)
            Button{
                
            }  label: {
                Text("로그인하기")
                    .foregroundColor(.white)
                    .font(.mainTextMedium16)
            }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13.5)
                .background(Color("green01"))
                .cornerRadius(20)
                
        }

    }

    private var socialLoginGroup : some View{
            VStack{
                Text("이메일로 회원가입하기")
                    .underline()
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color("Gray02"))
                    .padding(.bottom, 5)
                Image("kakao")
                    .padding(.bottom, 5)
                Image("apple")
            }
            .padding(.horizontal, 19)
    }

}

#Preview("iPhone 11") {
    LoginView()
}

#Preview("iPhone 16 Pro") {
    LoginView()
}
