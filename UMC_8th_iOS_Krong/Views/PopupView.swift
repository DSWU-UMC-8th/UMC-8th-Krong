//
//  Popup.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/1/25.
//

import SwiftUI

struct PopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Image("adv")
//                .ignoresSafeArea(edges: .top)
            Spacer()
            
            buttonGroup
            
        }
        
    }
    
    private var buttonGroup: some View {
        VStack{
            Button(action: {
                print("자세히 보기")
            }, label: {
                Text("자세히 보기")
                    .font(.mainTextRegular18)
                    .foregroundStyle(Color.white)
            })
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18.5)
            .background(Color("green01"))
            .cornerRadius(20)
            .padding(.horizontal, 19)
            
            HStack{
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    Text("X 닫기")
                        .font(.mainTextLight14)
                        .foregroundStyle(Color("gray05"))
                })
            }
            .padding(.top, 19)
            .padding(.horizontal, 37)
        }
       
    }

        
}

#Preview("iPhone 11") {
    PopupView()
}

#Preview("iPhone 16 Pro") {
    PopupView()
}
