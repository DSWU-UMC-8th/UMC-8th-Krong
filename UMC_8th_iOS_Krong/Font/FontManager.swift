//
//  FontManager.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/23/25.
//

import SwiftUI

extension Font{
    enum Pretendard{
        case mainTextBold20
        case mainTextBold24
        case mainTextSemibold24
        case mainTextSemiBold18
        case mainTextSemiBold16
        case mainTextSemiBold14
        case mainTextMedium16
        case mainTextRegular18
        case mainTextRegular13
        case mainTextRegular12
        case mainTextRegular09
        case mainTextLight14
        case mainTextExtraBold24
        case mainTextSemiBold38
        case mainTextSemiBold13
        
        var name: String{
            switch self{
            case .mainTextBold20:
                return "Pretendard-Bold"
            case .mainTextBold24:
                return "Pretendard-Bold"
            case .mainTextSemibold24:
                return "Pretendard-SemiBold"
            case .mainTextSemiBold18:
                return "Pretendard-SemiBold"
            case .mainTextSemiBold16:
                return "Pretendard-SemiBold"
            case .mainTextSemiBold14:
                return "Pretendard-SemiBold"
            case .mainTextMedium16:
                return "Pretendard-Medium"
            case .mainTextRegular18:
                return "Pretendard-Regular"
            case .mainTextRegular13:
                return "Pretendard-Regular"
            case .mainTextRegular12:
                return "Pretendard-Regular"
            case .mainTextRegular09:
                return "Pretendard-Regular"
            case .mainTextLight14:
                return "Pretendard-Light"
            case .mainTextExtraBold24:
                return "Pretendard-ExtraBold"
            case .mainTextSemiBold38:
                return "Pretendard-SemiBold"
            case .mainTextSemiBold13:
                return "Pretendard-SemiBold"
            }
        }
        
        var size: CGFloat {
            switch self {
            case .mainTextBold20:
                return 20
            case .mainTextBold24:
                return 24
            case .mainTextSemibold24:
                return 24
            case .mainTextSemiBold18:
                return 18
            case .mainTextSemiBold16:
                return 16
            case .mainTextSemiBold14:
                return 14
            case .mainTextMedium16:
                return 16
            case .mainTextRegular18:
                return 18
            case .mainTextRegular13:
                return 13
            case .mainTextRegular12:
                return 12
            case .mainTextRegular09:
                return 09
            case .mainTextLight14:
                return 14
            case .mainTextExtraBold24:
                return 24
            case .mainTextSemiBold38:
                return 38
            case .mainTextSemiBold13:
                return 13
            }
        }

        
    }
    
    static func pretendard(_ type: Pretendard) -> Font {
        return .custom(type.name, size: type.size)
    }
}
