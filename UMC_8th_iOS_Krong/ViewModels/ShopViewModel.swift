//
//  ShopViewModel.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/14/25.
//

import Foundation

@Observable
class ShopViewModel {
    let AllProductsList: [ProductsModel] = [
        .init(name: "텀블러", image: .init(.product1)),
        .init(name: "커피 용품", image: .init(.product2)),
        .init(name: "선물세트", image: .init(.product3)),
        .init(name: "보온병", image: .init(.product4)),
        .init(name: "머그/컵", image: .init(.product5)),
        .init(name: "라이프스타일", image: .init(.product6)),
    ]
    
    let BestItemsList: [ProductsModel] = [
        .init(name: "그린 사이렌 슬리브 머그 355ml", image: .init(.items1)),
        .init(name: "그린 사이렌 클래식 머그 355ml", image: .init(.items2)),
        .init(name: "사이렌 머그 앤 우드 소서", image: .init(.items3)),
        .init(name: "리저브 골드 테일 머그 355ml", image: .init(.items4)),
        .init(name: "블랙 앤 골드 머그 473ml", image: .init(.items5)),
        .init(name: "블랙 링 머그 355ml", image: .init(.items6)),
        .init(name: "북청사자놀음 데미머그 89ml", image: .init(.items7)),
        .init(name: "서울 제주 데미머그 세트", image: .init(.items8))
    ]
    
    let NewProducts: [ProductsModel] = [
        .init(name: "그린 사이렌 도트 머그 237ml", image: .init(.newProducts1)),
        .init(name: "그린 사이렌 도트 머그 355ml", image: .init(.newProducts2)),
        .init(name: "홈 카페 미니 머그 세트", image: .init(.newProducts3)),
        .init(name: "홈 카페 글라스 세트", image: .init(.newProducts4))
    ]
}
