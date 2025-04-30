//
//  ReceiptModel.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/29/25.
//

import SwiftUI
import SwiftData
import Foundation

@Model
class ReceiptModel {
    @Attribute(.unique) var id: UUID

    var store: String
    var date: String
    var total: Int
    var image: Data
    var createdAt: Date
    
    init(
     store: String,
     date: String,
     total: Int,
     image: Data,
     createdAt: Date = Date()
    ){
        self.id = UUID()
        self.store = store
        self.date = date
        self.total = total
        self.image = image
        self.createdAt = createdAt
    }
}
