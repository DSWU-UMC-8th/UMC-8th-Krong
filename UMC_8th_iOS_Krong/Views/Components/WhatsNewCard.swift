//
//  WhatsNewCard.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/9/25.
//
import SwiftUI
import Foundation

struct WhatsNewCard: View{
    let image: Image
    let title: String
    let info: String
    
    var body: some View {
        Button(action: {}, label: {
            VStack{
                image
                    .padding(.bottom, 16)
                Text(title)
                    .lineLimit(1)
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(.black02)
                    .padding(.bottom, 9)
                Text(info)
                    .foregroundStyle(.gray03)
                    .font(.mainTextSemiBold13)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        })
        .frame(width: 240)
    }
}
