//
//  SignupViewModel.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/31/25.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var user: SignupModel = SignupModel(nickname: "", email: "", pwd: "")
    
    @AppStorage("nickname") private var stNickname: String = ""
    @AppStorage("email") private var stEmail: String = ""
    @AppStorage("pwd") private var stPwd: String = ""
    
    func signup() {
        stNickname = user.nickname
        stEmail = user.email
        stPwd = user.pwd
    }
}
