//
//  Receipt.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/14/25.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ReceiptView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var refreshID = UUID()
    
        @Query(filter: #Predicate { _ in true }, sort: \ReceiptModel.createdAt, order: .reverse) private var receipts: [ReceiptModel]
        
        @State private var isPresented = false
        @State private var selectedItem: [PhotosPickerItem] = []
        @State private var showPhotosPicker = false
        @State private var showCamera = false
        @State private var selectedImage = UIImage()
        @State private var showReceiptImage = false
        @State private var selectedReceiptImage: UIImage? = nil

        @State private var viewModel = ReceiptViewModel()
    
    var body: some View {
        VStack{
            TopGroup
            TopReceiptInfoGroup
            ReceiptList
            Spacer()
        }
        .id(refreshID)
        .background(.white01)
        .navigationBarBackButtonHidden()
        .fullScreenCover(isPresented: $showReceiptImage){
            ZStack(alignment: .topTrailing) {
                if let image = selectedReceiptImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .background(Color.black.opacity(0.9))
                        .ignoresSafeArea()
                }
                Button(action: {
                    showReceiptImage = false
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                        .padding()
                }
            }
        }
    }
    
    
    private var TopGroup: some View {
        HStack{
            Button(action: {
                dismiss()}, label: {
                    Image(.goback)
                }
            )
            
            Spacer()
            Text("전자영수증")
                .font(.mainTextMedium16)
            Spacer()
            Button(action:{
                isPresented = true
            }, label: {
                Image(.plus)
            })
            .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $isPresented, titleVisibility: .visible, actions: {
                Button("앨범에서 가져오기"){
                    showPhotosPicker = true
                }
                Button("카메라로 촬용하기"){
                    showCamera = true
                }
            })
            .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItem, matching: .images)
            .onChange(of: selectedItem) { oldItems, newItems in
                Task {
                    guard let item = newItems.first else { return }
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        selectedImage = image
                        viewModel.performOCR(on: image, context: modelContext)
                        refreshID = UUID()
                    }
                }
            }
            
        }
        .padding(.horizontal, 13.5)
        .padding(.vertical, 22)
        .background(.white)
    }
    
    private var TopReceiptInfoGroup: some View {
            HStack {
                Text("총 ")
                    .font(.mainTextRegular18)
                + Text("\(receipts.count)건")
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(.brown01)
                Spacer()
                Text("사용합계 ")
                    .font(.mainTextRegular18)
                + Text("\(receipts.map(\.total).reduce(0, +))원")
                    .font(.mainTextSemiBold18)
                    .foregroundStyle(.brown01)
            }
            .padding(.horizontal, 18)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
    
    private var ReceiptList: some View {
        List {
            ForEach(receipts) { receipt in
                HStack{
                    VStack(alignment: .leading) {
                        Text(receipt.store)
                            .font(.mainTextSemiBold18)
                            .padding(.bottom, 9)
                        Text(receipt.date)
                            .font(.mainTextMedium16)
                            .foregroundStyle(.gray03)
                            .padding(.bottom, 9)
                        Text("\(receipt.total)원")
                            .font(.mainTextSemiBold18)
                            .foregroundStyle(.brown01)
                            .padding(.bottom, 14)
                    }
                    .padding(.vertical, 8)
                    
                    Spacer()
                    
                    Button(action:{
                        if let uiImage = UIImage(data: receipt.image) {
                            selectedReceiptImage = uiImage
                            showReceiptImage = true
                        }
                    }, label: {
                        Image(.dollar)
                    })
                }
                
            }
        }
        .listStyle(.plain)
    }
        
}

#Preview("iPhone 11") {
    ReceiptView()
}

#Preview("iPhone 16 Pro") {
    ReceiptView()
}
