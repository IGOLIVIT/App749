//
//  SettingsView.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/db89666a-53f2-4e6d-96a6-4356d8ad0707") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Rate app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
