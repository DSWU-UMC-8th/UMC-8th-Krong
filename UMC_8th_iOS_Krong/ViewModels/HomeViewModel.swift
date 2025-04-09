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
    
    var NewList: [WhatsNewModel] = [
        .init(title: "25년 3월 일회용컵 없는 날 캠페인", Image: .init(.whatsnew1), info: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        .init(title: "스타벅스 ㅇㅇㅇ점을 찾습니다.", Image: .init(.whatsnew2), info: "스타벅스 커뮤니티 스토어 파트너를 운영할 기관을 공모합니다."),
        .init(title: "2월 8일, 리저브 스프링 신규 커피", Image: .init(.whatsnew3), info: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
    ]
    
    var DessertList: [DessertModel] = [
        .init(name: "너티 크루아상", image: .init(.dessert1)),
        .init(name: "매콤 소시지 불고기", image: .init(.dessert2)),
        .init(name: "미니 리프 파이", image: .init(.dessert3)),
        .init(name: "뺑 오 쇼콜라", image: .init(.dessert4)),
        .init(name: "소시지&올리브 파이", image: .init(.dessert5))
    ]
}
