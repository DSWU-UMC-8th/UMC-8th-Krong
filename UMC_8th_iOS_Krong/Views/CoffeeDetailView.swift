//
//  CoffeeDetailView.swift
//  UMC_8th_iOS_Krong
//
//  Created by 정서영 on 4/9/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    @Environment(\.dismiss) var dismiss

    let menuName: String
    let viewModel = CoffeeDetailViewModel()
    @State private var selectedType: CoffeeType = .ICED


    var body: some View {
        if let coffee = viewModel.CoffeeDetailList.first(where: { $0.name == menuName }) {
            ZStack(alignment: .top){
                coffee.image
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea(edges: .all)
                
                
                HStack{
                    Button(action:{
                        dismiss()
                    }, label: {
                        Image(.coffeedetailGoback)
                    })
                    Spacer()
                    Button(action:{
                        
                    }, label: {
                        Image(.shareMenu)
                    })
                }
                .padding(.horizontal, 10)
                .navigationBarBackButtonHidden()
            }
                
            
            VStack (alignment: .leading){
                HStack{
                    Text(coffee.name)
                        .font(.mainTextSemiBold24)
                        .foregroundStyle(.black03)
                        .padding(.bottom, 4)
                    
                    Image(.new)
                }
                
                Text(coffee.nameEng)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(.gray01)
                    .padding(.bottom, 32)
                Text(coffee.info)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(.gray06)
                    .padding(.bottom, 20)
                
                Text("\(coffee.price)")
                    .font(.mainTextBold24)
                    .foregroundStyle(.black03)
                
                Spacer().frame(height: 32)

                Group {
                    if coffee.CoffeeType == .HOT || coffee.CoffeeType == .ICED {
                        ZStack{
                            RoundedRectangle(cornerRadius: 999)
                                .frame(width: .infinity, height: 36)
                                .foregroundStyle(.gray07)
                            HStack{
                                Button(action: {
                                    selectedType = .HOT
                                }, label: {
                                    Text("HOT")
                                        .font(.mainTextSemiBold18)
                                        .frame(maxWidth: .infinity, maxHeight: 36)
                                        .foregroundStyle(selectedType == .HOT ? .red :.gray02)
                                        .background(selectedType == .HOT ? .white :.gray07)
                                        .clipShape(RoundedRectangle(cornerRadius: 999))
                                        .shadow(radius: selectedType == .HOT ? 5 : 0)
                                })
                                Spacer()

                                Button(action: {
                                    selectedType = .ICED
                                }, label: {
                                    Text("ICED")
                                        .font(.mainTextSemiBold18)
                                        .frame(maxWidth: .infinity, maxHeight: 36)
                                        .foregroundStyle(selectedType == .ICED ? .blue :.gray02)
                                        .background(selectedType == .ICED ? .white :.gray07)
                                        .clipShape(RoundedRectangle(cornerRadius: 999))
                                        .shadow(radius: selectedType == .ICED ? 5 : 0)
                                })
                            }
                        }
                        
                    } else {
                        let isHotOnly = coffee.CoffeeType == .HOTONLY
                        Text(isHotOnly ? "HOT ONLY" : "ICED ONLY")
                            .font(.mainTextSemiBold18)
                            .frame(maxWidth: .infinity, maxHeight: 36)
                            .foregroundStyle(selectedType == .ICEDONLY ? .blue :.red)
                            .overlay(RoundedRectangle(cornerRadius: 999)
                                .stroke(.gray00))
                    }
                }
                
                Spacer()
                
                Button(action: {
                    print("주문하기")
                }, label: {
                    Text("주문하기")
                        .foregroundColor(.white)
                        .font(.mainTextMedium16)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13.5)
                .background(.green00)
                .cornerRadius(999)
            }
            .padding(.horizontal, 28)
//            .navigationTitle(coffee.name)
//            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // 초기값 설정
                selectedType = coffee.CoffeeType
            }
        } else {
            Text("해당 커피 정보를 찾을 수 없습니다.")
                .foregroundStyle(.red)
        }
    }
}
    

#Preview("iPhone 11") {
    CoffeeDetailView(menuName: "에스프레소 콘 파나")
}

#Preview("iPhone 16 Pro") {
    CoffeeDetailView(menuName: "카라멜 마끼아또")
}
