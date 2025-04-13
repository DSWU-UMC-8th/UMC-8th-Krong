//
//  SignupView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/31/25.
//

import SwiftUI

enum signupField {
    case nickname
    case email
    case pwd
}

struct SignupView: View {
    @StateObject var ViewModel: SignupViewModel = SignupViewModel()
    @FocusState var focusField: signupField?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            headerGroup
            Spacer()
            signupGroup
            Spacer()
            buttonGroup
                .padding(.bottom, 72)
        }
        .padding(.horizontal, 19)
        .navigationBarBackButtonHidden()
    }
    
    private var headerGroup: some View {
        HStack{
            Button(action: {
                dismiss()
            }, label: {
                Image(.goback)
            })
            
            Spacer()
            Text("가입하기")
                .font(.title2)
            Spacer()
        }
        .padding(.top, 18)
    }

    private var signupGroup: some View {
        VStack{
            TextField("닉네임", text: $ViewModel.user.nickname)
                .font(.mainTextRegular13)
                .foregroundStyle(Color("Gray02"))
                .focused($focusField, equals: .nickname)
            Divider()
                .background(focusField == .nickname ? Color("starbucksGreen") : Color("Gray00"))
                .frame(height: 2)
                .padding(.bottom, 49)
            TextField("이메일", text: $ViewModel.user.email)
                .font(.mainTextRegular13)
                .foregroundStyle(Color("Gray02"))
                .focused($focusField, equals: .email)
            Divider()
                .background(focusField == .email ? Color("starbucksGreen") : Color("Gray00"))
                .frame(height: 2)
                .padding(.bottom, 49)
            SecureField("비밀번호", text: $ViewModel.user.pwd)
                .font(.mainTextRegular13)
                .foregroundStyle(Color("Gray02"))
                .focused($focusField, equals: .pwd)
            Divider()
                .background(focusField == .pwd ? Color("starbucksGreen") : Color("Gray00"))
                .padding(.bottom, 49)
        }
    }
    
    
    private var buttonGroup: some View {
        Button(action: {
            if ViewModel.user.nickname.count > 0 && ViewModel.user.email.count > 0 && ViewModel.user.pwd.count > 0 {
                ViewModel.signup()
                dismiss()
            }
        }, label: {
            Text("생성하기")
                .font(.mainTextRegular18)
                .foregroundStyle(Color.white)
        })
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18.5)
        .background(Color("green01"))
        .cornerRadius(20)
    }
}

#Preview("iPhone 11") {
    SignupView()
}

#Preview("iPhone 16 Pro") {
    SignupView()
}
