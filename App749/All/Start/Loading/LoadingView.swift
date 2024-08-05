//
//  LoadingView.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(60)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    LoadingView()
}
