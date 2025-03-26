//
//  FontManager.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 3/23/25.
//
import Foundation
import SwiftUI

extension Font{
    enum Pretendard{
        case bold
        case semibold
        case medium
        case regular
        case light
        case extrabold
        
        var value: String{
            switch self{
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            case .extrabold:
                return "Pretendard-ExtraBold"
            }
        }
        
    }
    
    static func pretend(type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var mainTextBold20: Font {
        return .pretend(type: .bold, size: 20)
    }
    
    static var mainTextBold24: Font {
        return .pretend(type: .bold, size: 24)
    }
    
    static var mainTextSemiBold24: Font {
        return .pretend(type: .semibold, size: 24)
    }
    
    static var mainTextSemiBold18: Font {
        return .pretend(type: .semibold, size: 18)
    }
    
    static var mainTextSemiBold16: Font {
        return .pretend(type: .semibold, size: 16)
    }
    
    static var mainTextSemiBold14: Font {
        return .pretend(type: .semibold, size: 14)
    }
    
    static var mainTextMedium16: Font {
        return .pretend(type: .medium, size: 16)
    }
    
    static var mainTextRegular18: Font {
        return .pretend(type: .regular, size: 18)
    }
    
    static var mainTextRegular13: Font {
        return .pretend(type: .regular, size: 13)
    }
    
    static var mainTextRegular12: Font {
        return .pretend(type: .regular, size: 12)
    }
    
    static var mainTextRegular09: Font {
        return .pretend(type: .regular, size: 09)
    }
    
    static var mainTextLight14: Font {
        return .pretend(type: .light, size: 14)
    }
    
    static var mainTextExtraBold24: Font {
        return .pretend(type: .extrabold, size: 24)
    }
    
    static var mainTextSemiBold38: Font {
        return .pretend(type: .semibold, size: 38)
    }
    
    static var mainTextSemiBold13: Font {
        return .pretend(type: .semibold, size: 13)
    }
  
}
