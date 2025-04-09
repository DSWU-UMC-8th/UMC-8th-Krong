//
//  HomeView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/7/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @AppStorage("stNickname") private var nickname: String = "(설정 닉네임)"
    
    var body: some View {
        topGroup
            .ignoresSafeArea(edges: .top)
        Spacer()
        mainContentGroup
        Spacer()
    }
    
    //상단 배너
    private var topGroup: some View {
        ZStack {
            Image(.homeTopBg)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea(edges: .top)
            
            VStack{
                HStack{
                    Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                        .font(.mainTextBold24)
                    Spacer()
                }
                .padding(.top, 106)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("11★ until next Reward")
                            .font(.mainTextSemiBold16)
                            .foregroundStyle(.brown02)
                        GeometryReader{ geometry in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .foregroundStyle(.infoGray)
                                Capsule()
                                    .frame(width: geometry.size.width * 0.4)
                                    .foregroundStyle(.brown02)
                            }
                        }
                        .frame(width: 240, height: 8)
                    }
                    Spacer()
                    
                    HStack {
                        Text("1")
                            .font(.mainTextSemiBold38)
                        Text("/")
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(.gray00)
                        Text("12★")
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(.brown02)
                    }
                }
                .padding(.top, 26)
            }
            .padding(.horizontal, 28)
        }
    }
    
    //전체 컨텐츠
    private var mainContentGroup: some View {
        VStack{
            // 곰돌이 광고
            Image(.bearAD)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 20)
            
            // 유저 추천 메뉴
            VStack{
                HStack{
                    Text("\(nickname)")
                        .font(.mainTextBold24)
                        .foregroundStyle(.brown01)
                    +
                    Text("님을 위한 추천 메뉴")
                        .font(.mainTextBold24)
                    Spacer()
                }
                .padding(.bottom, 25)
                ScrollView(.horizontal){
                    HStack{
                        ForEach(viewModel.recommendList, id: \.menuId){
                            item in CircleImageCard(menuInfo: item)
                        }
                    }
                }
            }
            
            
        }
        .padding(.horizontal, 10)
    }
}

#Preview("iPhone 11") {
    HomeView()
}

#Preview("iPhone 16 Pro") {
    HomeView()
}
