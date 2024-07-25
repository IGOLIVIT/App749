//
//  U1.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                
                VStack {
                    
                    Text("History of games on your smartphone!")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color("bg"))
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    U1()
}
