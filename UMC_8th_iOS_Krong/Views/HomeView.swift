//
//  HomeView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/7/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        topGroup
            .ignoresSafeArea(edges: .top)
        Spacer()
        mainContentGroup
        
    }
    
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
    
    private var mainContentGroup: some View {
        VStack{
            
        }
    }
}

#Preview("iPhone 11") {
    HomeView()
}

#Preview("iPhone 16 Pro") {
    HomeView()
}
