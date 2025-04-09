//
//  HomeViewModel.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/7/25.
//

import Foundation

@Observable
class HomeViewModel {
    var recommendList: [RecommendModel] = [
        .init(menuName: "에스프레소 콘파나", menuImage: .init(.conpanna)),
        .init(menuName: "에스프레소 마키아또", menuImage: .init(.macchiato)),
        .init(menuName: "아이스 카페 아메리카노", menuImage: .init(.iceamericano)),
        .init(menuName: "카페 아메리카노", menuImage: .init(.americano)),
        .init(menuName: "아이스 카라멜 마키아또", menuImage: .init(.icecaramel)),
        .init(menuName: "카라멜 마키아또", menuImage: .init(.caramel))
    ]
}
