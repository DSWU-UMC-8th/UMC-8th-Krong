//
//  TabBar.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/1/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Tab("Home", image: "home") {}
            Tab("Pay", image: "pay") {}
            Tab("Order", image: "order") {}
            Tab("Shop", image: "shop") {}
            Tab("Other", image: "other") {
                OtherView()
            }
        }
        .tint(.green02)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .black01
        }
    }
}

#Preview("iPhone 11") {
    TabBar()
}

#Preview("iPhone 16 Pro") {
    TabBar()
}
