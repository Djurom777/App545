//
//  SettingsView.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
        
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 12) {

                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Rate Us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(Rectangle().fill(.black))
                        })

                        Button(action: {
                            
                            guard let url = URL(string: "https://docs.google.com/document/d/1w6qNcpJO16uZuuP4y7937GM-thR_6DyL8L6LZWgsdkQ/edit?usp=sharing") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(spacing: 12) {

                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(Rectangle().fill(.black))
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
