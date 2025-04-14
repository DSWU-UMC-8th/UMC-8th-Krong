//
//  OtherView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/1/25.
//

import SwiftUI

struct OtherView: View {
    @State private var viewModel = OtherViewModel()
    @AppStorage("nickname") private var nickname: String = "(작성한 닉네임)"
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        if !isLoggedIn {
            LoginView()
        } else{
            NavigationStack{
                ZStack{
                    Color(.otherGray)
                    VStack{
                        headerGroup
                        Spacer()
                        userGroup
                        Spacer()
                        payGroup
                        Spacer()
                        otherGroup
                        Spacer()
                    }
                }
                .navigationBarBackButtonHidden()
            }
        }
    }
    
    private var headerGroup: some View {
        HStack{
            Text("Other")
                .font(.mainTextBold24)
            Spacer()
            Button(action:{
                isLoggedIn = false
            }, label: {
                Image(.logout)
            })
        }
        .padding(.horizontal, 23.5)
        .padding(.bottom, 16)
        .background(.white)
    }
        
    
    private var userGroup: some View {
        VStack{
            HStack{
                Text(nickname)
                    .font(.mainTextSemiBold24)
                    .foregroundStyle(.green01)
                Text("님")
                    .font(.mainTextSemiBold24)
                    .foregroundStyle(.black01)
            }
            Text("환영합니다!🙌🏻")
                .font(.mainTextSemiBold24)
                .foregroundStyle(.black01)
                .padding(.bottom, 24)
            HStack(spacing: 10.5) {
                ForEach(viewModel.userButton, id: \.title) { button in UserGroupButton(buttonInfo: button)
                }
            }
        }
    }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    private var payGroup: some View{
            VStack{
                Text("Pay")
                    .font(.mainTextSemiBold18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 9)
                LazyVGrid(columns: columns, alignment: .leading) {
                    ForEach(viewModel.payButton, id: \.title) {
                        button in OtherGroupButton(buttonInfo: button)
                    }
                    .padding(.vertical, 16)
                }
                HStack{
                    Divider()
                        .frame(width: 327, height: 0.5)
                        .background(.gray00)
                    Spacer()
                }
                
                
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 19)
    }
    
    private var otherGroup: some View{
        VStack{
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 9)
            LazyVGrid(columns: columns, alignment: .leading) {
                ForEach(viewModel.otherButton, id: \.title) {
                    button in OtherGroupButton(buttonInfo: button)
                }
                .padding(.vertical, 16)
            }
    }
    .frame(maxWidth: .infinity)
    .padding(.horizontal, 19)
    }

}

#Preview("iPhone 11") {
    OtherView()
}

#Preview("iPhone 16 Pro") {
    OtherView()
}
