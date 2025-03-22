//
//  LoginView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/23/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment:.leading) {
                    Image("logo")
                        .resizable()
                        .frame(width: 97, height: 95)
                        .padding(.bottom, 5)
                    Text("안녕하세요.")
                        .font(.pretendard(.mainTextExtraBold24))
                    Text("스타벅스입니다.")
                        .font(.pretendard(.mainTextExtraBold24))
                        .padding(.bottom, 3)
                    Text("회원 서비스 이용을 위해 로그인 해주세요.")
                        .font(.pretendard(.mainTextMedium16))
                        .foregroundStyle(Color("InfoGray"))
                }
                Spacer()
            }
    
            .padding(.bottom, 60)
            
            VStack(alignment:.leading){
                Text("아이디")
                    .font(.pretendard(.mainTextRegular13))
                    .foregroundStyle(Color("black01"))
                Divider()
                    .padding(.bottom, 40)
                Text("비밀번호")
                    .font(.pretendard(.mainTextRegular13))
                    .foregroundStyle(Color("black01"))
                Divider()
                    .padding(.bottom, 47)
                Button{
                    
                }  label: {
                    Text("로그인하기")
                        .foregroundColor(.white)
                        .font(.pretendard(.mainTextMedium16))
                }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 13.5)
                    .background(Color("starbucksGreen"))
                    .cornerRadius(20)
                    
            }
            .padding(.bottom, 60)

            VStack{
                Text("이메일로 회원가입하기")
                    .underline()
                    .font(.pretendard(.mainTextRegular12))
                    .foregroundStyle(Color("Gray02"))
                    .padding(.bottom, 5)
                Image("kakao")
                    .padding(.bottom, 5)
                Image("apple")
            }
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
