//
//  CoffeeDetail.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/9/25.
//

import SwiftUI
import Foundation

enum CoffeeType {
    case HOT
    case ICED
    case HOTONLY
    case ICEDONLY
}

struct CoffeeDetailModel {
    let id : UUID = UUID()
    let image : Image
    let name : String
    let nameEng : String
    let info : String
    let price : String
    let CoffeeType : CoffeeType
}
