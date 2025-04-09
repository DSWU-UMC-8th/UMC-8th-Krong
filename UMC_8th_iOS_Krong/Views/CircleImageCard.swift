//
//  CircleImageCard.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/8/25.
//

import SwiftUI
import Foundation

struct CircleImageCard: View {
    let image : Image
    let name : String
        
    var body: some View {
        Button(action: {}, label: {
            VStack{
                image
                    .padding(.top, 10)
                Text(name)
                    .foregroundStyle(.black02)
            }
        })
    }
}

