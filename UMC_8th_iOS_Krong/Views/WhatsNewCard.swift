//
//  WhatsNewCard.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/9/25.
//
import SwiftUI
import Foundation

struct WhatsNewCard: View{
    let newInfo : WhatsNewModel
    
    init(newInfo : WhatsNewModel) {
        self.newInfo = newInfo
    }
    
    var body: some View {
        Button(action: {}, label: {
            VStack{
                newInfo.Image
                    .padding(.bottom, 16)
                Text(newInfo.title)
                    .lineLimit(1)
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(.black02)
                    .padding(.bottom, 9)
                Text(newInfo.info)
                    .foregroundStyle(.gray03)
                    .font(.mainTextSemiBold13)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        })
        .frame(width: 240)
    }
}
