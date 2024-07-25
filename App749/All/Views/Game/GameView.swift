//
//  GameView.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Text("SCORE THE GAME")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                        .padding(.vertical)
                    
                    Text("\(viewModel.scoreGame1)     -     \(viewModel.scoreGame2)")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    
                    VStack(spacing: 14) {
                        
                        Text("Player 1")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                            .padding(5)
                            .padding(.horizontal, 5)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.scorePl1 -= 1
                                
                            }, label: {
                                
                                Image(systemName: "minus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                            })
                            
                            Text("\(viewModel.scorePl1)")
                                .foregroundColor(.white)
                                .font(.system(size: 56, weight: .bold))
                                .padding(.horizontal, 30)
                            
                            Button(action: {
                                
                                viewModel.scorePl1 += 1
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                            })
                        }
                        
                        
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
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.scorePl2 -= 1
                                
                            }, label: {
                                
                                Image(systemName: "minus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("red")))
                            })
                            
                            Text("\(viewModel.scorePl2)")
                                .foregroundColor(.white)
                                .font(.system(size: 56, weight: .bold))
                                .padding(.horizontal, 30)
                            
                            Button(action: {
                                
                                viewModel.scorePl2 += 1
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("red")))
                            })
                        }
                        
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        if viewModel.scorePl1 > viewModel.scorePl2 {
                            
                            viewModel.scoreGame1 += 1
                            
                        } else  if viewModel.scorePl1 < viewModel.scorePl2 {
                            
                            viewModel.scoreGame2 += 1

                        }
                        
                        viewModel.scorePl1 = 0
                        viewModel.scorePl2 = 0
                        
                    }, label: {
                        
                        Text("Stop the round")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("red")))
                    })
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    GameView()
}
