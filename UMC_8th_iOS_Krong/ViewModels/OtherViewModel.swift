//
//  OtherViewModel.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/1/25.
//

import Foundation
import SwiftUI

@Observable
class OtherViewModel{
    let userButton: [OtherModel] = [
        .init(image: .init(.star), title: "별 히스토리"),
        .init(image: .init(.receipt), title: "전자영수증"),
        .init(image: .init(.menu), title: "나만의 메뉴"),
    ]
    
    let payButton: [OtherModel] = [
        .init(image: .init(.sbCard), title: "스타벅스 카드 등록"),
        .init(image: .init(.cardChange), title: "카드 교환권 등록"),
        .init(image: .init(.couponRegi), title: "쿠폰 등록"),
        .init(image: .init(.coupon), title: "쿠폰 히스토리")
    ]
    
    let otherButton: [OtherModel] = [
        .init(image: .init(.store), title: "스토어 케어"),
        .init(image: .init(.sound), title: "고객의 소리"),
        .init(image: .init(.location), title: "매장 정보"),
        .init(image: .init(.return), title: "반납기 정보"),
        .init(image: .init(.review), title: "마이 스타벅스 리뷰")
    ]
        
}

