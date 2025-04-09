//
//  CircleImageCard.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/8/25.
//

import SwiftUI
import Foundation

struct CircleImageCard: View {
    
    let menuInfo : RecommendModel
    
    init(menuInfo : RecommendModel) {
        self.menuInfo = menuInfo
    }
    
    var body: some View {
        VStack{
            menuInfo.menuImage
                .padding(.top, 10)
            Text(menuInfo.menuName)
        }
    }
}
