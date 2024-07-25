//
//  R1.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"),Color("prim"), Color("bg")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                
                VStack {
                    
                    Text("Your Perfect Badminton Companion!")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
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
    R1()
}
