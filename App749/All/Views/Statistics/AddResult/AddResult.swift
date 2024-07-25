//
//  AddResult.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct AddResult: View {

    @StateObject var viewModel: StatisticsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add the result")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        VStack(spacing: 14) {
                            
                            Text("Player 1")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .padding(5)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.Photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curPhoto1 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curPhoto1.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 100, height: 100)
                                        .background(Circle().fill(.white.opacity(0.1)))
                                    
                                } else {
                                    
                                    Image(viewModel.curPhoto1)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                }
                                
                            })
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.resName1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.resName1)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Game score")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.resScore1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.resScore1)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        VStack(spacing: 14) {
                            
                            Text("Player 2")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .padding(5)
                                .padding(.horizontal, 5)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("red")))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.Photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curPhoto2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curPhoto2.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 100, height: 100)
                                        .background(Circle().fill(.white.opacity(0.1)))
                                    
                                } else {
                                    
                                    Image(viewModel.curPhoto2)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                }
                                
                            })
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.resName2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.resName2)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Game score")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.resScore2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.resScore2)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.resDate, displayedComponents: .date)
                                .labelsHidden()
                                                        
                            DatePicker("", selection: $viewModel.resTime, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.graphical)
                                .labelsHidden()                
                        }
                        .padding(6)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        
                        Button(action: {
                            
                            viewModel.resPhoto1 = viewModel.curPhoto1
                            viewModel.resPhoto2 = viewModel.curPhoto2
                            
                            viewModel.addResult()
                            
                            viewModel.curPhoto1 = ""
                            viewModel.curPhoto2 = ""
                            viewModel.resName1 = ""
                            viewModel.resName2 = ""
                            viewModel.resScore1 = ""
                            viewModel.resScore2 = ""
                            
                            viewModel.fetchResults()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    AddResult(viewModel: StatisticsViewModel())
}
