//
//  ShopView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/14/25.
//

import SwiftUI

struct ShopView: View {
    @State private var viewModel = ShopViewModel()
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var currentPage = 0
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                TopBannerGroup
                Spacer().frame(height:36)
                AllProductGroup
                Spacer().frame(height:36)
                BestItemsGroup
                Spacer().frame(height:36)
                NewProductsGroup
            }
            
        }.background(.white01)
        
    }
    
    private var TopBannerGroup: some View {
        VStack(alignment: .leading) {
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
            Spacer().frame(height:16)
            ScrollView(.horizontal) {
                LazyHStack(spacing : 28){
                    Image(.shopBanner1)
                    Image(.shopBanner2)
                    Image(.shopBanner3)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var AllProductGroup: some View {
        VStack(alignment: .leading){
            Text("All Products")
                .font(.mainTextSemiBold24)
                .foregroundStyle(.black03)
            Spacer().frame(height:16)
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(viewModel.AllProductsList, id: \.name){
                        item in Button(action: {}, label: {
                            VStack{
                                item.image
                                Spacer().frame(height: 12)
                                Text(item.name)
                                    .font(.mainTextSemiBold14)
                                    .foregroundStyle(.black02)
                            }
                        })
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var BestItemsGroup: some View {
        VStack(alignment: .leading){
            Text("Best Items")
                .font(.mainTextSemiBold24)
                .foregroundStyle(.black03)
            Spacer().frame(height: 0)
            TabView(selection: $currentPage) {
                ForEach(0..<2, id: \.self){ page in
                    LazyVGrid(columns: columns, spacing: 61){
                        ForEach(0..<4, id: \.self) {
                            index in
                            let item = viewModel.BestItemsList[page * 4 + index]
                            Button(action: {}, label: {
                                VStack(alignment: .leading){
                                    item.image
                                        .resizable()
                                        .frame(width: 157, height: 156)
                                    Spacer().frame(height: 12)
                                    Text(item.name)
                                        .font(.mainTextSemiBold14)
                                        .foregroundStyle(.black02)
                                }
                            })
                        }
                    }
                    .tag(page)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 470)
            Spacer().frame(height: 16)
            
            HStack(spacing: 8) {
                Spacer()
                ForEach(0..<2, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? .black03 : .gray02)
                        .frame(width: 8, height: 8)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var NewProductsGroup: some View {
        VStack(alignment: .leading){
            Text("New Products")
                .font(.mainTextSemiBold24)
                .foregroundStyle(.black03)
            Spacer().frame(height:16)
            LazyVGrid(columns: columns, spacing: 61){
                ForEach(viewModel.NewProducts, id: \.name){
                    item in Button(action: {}, label: {
                        VStack(alignment: .leading){
                            item.image
                                .resizable()
                                .frame(width: 157, height: 156)
                            Spacer().frame(height: 12)
                            Text(item.name)
                                .font(.mainTextSemiBold14)
                                .foregroundStyle(.black02)
                        }
                    })
                }
            }
        }
        .padding(.horizontal, 16)
    }
        
}

#Preview("iPhone 11") {
    ShopView()
}

#Preview("iPhone 16 Pro") {
    ShopView()
}
