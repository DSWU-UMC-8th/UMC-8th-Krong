//
//  ReceiptViewModel.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/29/25.
//

import SwiftUI
import SwiftData
import Vision
import PhotosUI

@Observable
class ReceiptViewModel {
    var images: [UIImage] = []
    var recognizedText: String = ""
    
    func performOCR(on uiImage: UIImage, context: ModelContext) {
            guard let cgImage = uiImage.cgImage else { return }

            let request = VNRecognizeTextRequest { request, error in
                guard let results = request.results as? [VNRecognizedTextObservation] else { return }

                DispatchQueue.main.async {
                    let recognizedText = results.compactMap {
                        $0.topCandidates(1).first?.string
                    }.joined(separator: "\n")

                    self.recognizedText = recognizedText
                    
                    guard let imageData = uiImage.jpegData(compressionQuality: 1.0) else { return }
                    let receipt = self.parseWithoutRegex(from: recognizedText, imageData: imageData)
                    context.insert(receipt)
                    
                    do {
                        try context.save()
                        print("✅ 저장 성공: \(receipt.store), \(receipt.total)원")
                    } catch {
                        print("❌ 저장 실패: \(error)")
                    }
                }
            }

            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = true
            request.recognitionLanguages = ["ko-KR"]

            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])

            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try handler.perform([request])
                } catch {
                    print("OCR 실패: \(error)")
                }
            }
        }
    
    private func parseWithoutRegex(from text: String, imageData: Data) -> ReceiptModel {
        let lines = text.components(separatedBy: .newlines)
        
        var store = "장소 없음"
        var total = 0
        var date = "날짜 없음"
        
        var i = 0
    
        
        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            
            // 장소
            if store == "장소 없음", trimmed.contains("점") {
                store = "스타벅스 " + trimmed
            }
            
            // 결제 금액
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    total = amount
                }
            }
            
            // 날짜
            if date == "날짜 없음", trimmed.contains("-"), trimmed.contains(":"), !trimmed.contains("T") {
                date = trimmed
            }
            i+=1
        }
        return ReceiptModel(store: store, date: date, total: total, image: imageData)
    }
}
