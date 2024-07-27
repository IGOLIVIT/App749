//
//  StatisticsView.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEdit = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(Color("red"))
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image(systemName: "trophy")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 26, weight: .regular))
                        
                        Text("\(viewModel.TG)")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("Totel games")
                            .foregroundColor(.gray)
                            .font(.system(size: 11, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image(systemName: "arrow.up")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 26, weight: .regular))
                        
                        Text("\(viewModel.TW)")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("Totel wins")
                            .foregroundColor(.gray)
                            .font(.system(size: 11, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image(systemName: "arrow.down")
                            .foregroundColor(Color("red"))
                            .font(.system(size: 26, weight: .regular))
                        
                        Text("\(viewModel.TD)")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("Totel defeats")
                            .foregroundColor(.gray)
                            .font(.system(size: 11, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                }
                
                if viewModel.results.isEmpty {
                    
                    VStack(spacing: 23) {
                        
                        Image(systemName: "list.bullet")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 28, weight: .medium))
                        
                        Text("Here will be a history of your results.")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 200)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add a results")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.results, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.resPhoto1 ?? "")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 8) {
                                        
                                        Text("\(index.resScore1 ?? "") : \(index.resScore2 ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .bold))
                                        
                                        Text("\((index.resDate ?? Date()).convertDate(format: "dd.MM"))(\((index.resTime ?? Date()).convertDate(format: "HH:mm")))")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Text("\(index.resName1 ?? "") - \(index.resName2 ?? "")")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image(index.resPhoto2 ?? "")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            }
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                        .padding()
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .opacity(viewModel.results.isEmpty ? 0 : 1)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            EditStat()
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            AddResult(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchResults()
        }
    }
}

#Preview {
    StatisticsView()
}
