//
//  Untitled.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/1/25.
//

import SwiftUI

struct UserGroupButton: View {
    
    let buttonInfo : OtherModel
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            print(buttonInfo.title)
            action()
        }, label: {
            VStack{
                buttonInfo.image
                    .padding(.bottom, 7)
                Text(buttonInfo.title)
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(.black03)
            }
        })
        .frame(width: 102, height: 108, alignment: .center)
        .background(Color.white)
        .cornerRadius(19)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 0)
        
    }
}

struct OtherGroupButton: View {
    let buttonInfo : OtherModel
    
    init(buttonInfo: OtherModel) {
        self.buttonInfo = buttonInfo
    }
    
    var body: some View {
        Button(action: {
            print(buttonInfo.title)
        }, label: {
            HStack{
                buttonInfo.image
                Text(buttonInfo.title)
                    .font(.mainTextMedium16)
                    .foregroundStyle(.black02)
            }
        })
    }
}
