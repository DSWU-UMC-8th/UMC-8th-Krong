//
//  UMC_8th_iOS_KrongApp.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/23/25.
//

import SwiftUI

@main
struct UMC_8th_iOS_KrongApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                TabBar()
            } else {
                LoginView()
            }
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
