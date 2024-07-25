//
//  EditStat.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct EditStat: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit statistics")
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
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Total games")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.ATG.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.ATG)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .semibold))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Total wins")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.ATW.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.ATW)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .semibold))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Total defeats")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.ATD.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.ATD)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .semibold))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.05)))
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.TG = Int(viewModel.ATG) ?? 0
                    viewModel.TW = Int(viewModel.ATW) ?? 0
                    viewModel.TD = Int(viewModel.ATD) ?? 0

                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    EditStat()
}
