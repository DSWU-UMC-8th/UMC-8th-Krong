//
//  Splash.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/23/25.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("starbucksGreen"))
                .ignoresSafeArea()
            Image("logo")
        }
    }
}

#Preview("iPhone 11") {
    Splash()
}

#Preview("iPhone 16 Pro") {
    Splash()
}
