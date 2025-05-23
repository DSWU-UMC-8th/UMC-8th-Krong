//
//  HomeView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/7/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @AppStorage("nickname") private var nickname: String = "(설정 닉네임)"
    @State private var path = NavigationPath()
    @State private var showPopup = true
    
    var body: some View {
        NavigationStack(path: $path){
            ScrollView{
                VStack(spacing: 0){
                    topGroup
                    Spacer().frame(height: 23)
                    bearAdGroup
                    UserRecommandGroup
                    BloomingAdGroup
                    whatsNewGroup
                    ThreeBannerGroup
                    DessertGroup
                    Spacer().frame(height: 20)
                    ThreeBannerGroup2
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationDestination(for: String.self) { coffee in
                CoffeeDetailView(menuName: coffee)
            }
        }
        .navigationBarBackButtonHidden()
                .fullScreenCover(isPresented: $showPopup) {
                    PopupView()
                }
    }
    
    //상단 배너
    private var topGroup: some View {
        ZStack(alignment: .top) {
            Image(.homeTopBg)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                HStack{
                    Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                        .font(.mainTextBold24)
                    Spacer()
                }
                .padding(.top, 106)
                .padding(.bottom, 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("11★ until next Reward")
                            .font(.mainTextSemiBold16)
                            .foregroundStyle(.brown02)
                        GeometryReader{ geometry in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .foregroundStyle(.gray01)
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
            }
            .padding(.horizontal, 38)
        }
    }
    
    //전체 컨텐츠
    private var bearAdGroup: some View {
        // 곰돌이 광고
        Image(.bearAD)
            .resizable()
            .scaledToFit()
            .padding(.bottom, 20)
            .padding(.horizontal, 10)
    }
    
    private var UserRecommandGroup: some View {
        // 유저 추천 메뉴
        VStack(alignment: .leading){
            HStack{
                Text("\(nickname)")
                    .font(.mainTextBold24)
                    .foregroundStyle(.brown01)
                +
                Text("님을 위한 추천 메뉴")
                    .font(.mainTextBold24)
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.recommendList, id: \.menuId){
                        item in
                        Button(action: {path.append(item.menuName)}, label: {
                            CircleImageCard(image: item.menuImage, name: item.menuName)
                        })
                        
                    }
                }
            }
            .padding(.leading, 20)
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 10)
    }
    
    private var BloomingAdGroup: some View {
        //Blooming Choux-Pring 배너 및 정규 서비스 론칭 배너 사진
        VStack{
            Image(.eventBanner)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.bottom, 20)
            Image(.serviceSuscibe)
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 20)
    }
    
    private var whatsNewGroup: some View {
        //what's new
        VStack(alignment: .leading){
            Text("What's New")
                .font(.mainTextBold24)
                .foregroundStyle(.black03)
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(viewModel.NewList, id: \.newId){
                        item in WhatsNewCard(image: item.Image, title: item.title, info: item.info)
                    }
                }
            }
        }
        .padding(.leading, 20)
        .padding(.bottom, 20)
        .padding(.horizontal, 10)
    }
    
    private var ThreeBannerGroup: some View {
        // 배너 3
        VStack{
            Image(.homeBanner1)
            Image(.homeBanner2)
            Image(.homeBanner3)
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 10)
    }
    
    private var DessertGroup: some View {
        // 하루가 달콤해지는 디저트
        VStack(alignment: .leading){
            Text("하루가 달콤해지는 디저트")
                .padding(.leading, 10)
                .font(.mainTextSemiBold24)
                .foregroundStyle(.black03)
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.DessertList, id: \.id){
                        item in CircleImageCard(image: item.image, name: item.name)
                    }
                }
            }
        }
        .padding(.leading, 20)
        .padding(.horizontal, 10)
    }
    
    private var ThreeBannerGroup2: some View {
        // 배너 3
        VStack{
            Image(.homeBanner4)
            Image(.homeBanner5)
            Image(.homeBanner6)
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 10)
        
    }
}

#Preview("iPhone 11") {
    HomeView()
}

#Preview("iPhone 16 Pro") {
    HomeView()
}
