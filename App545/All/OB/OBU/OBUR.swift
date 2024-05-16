//
//  OBUR.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI
import StoreKit

struct OBUR: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("UOBR")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 80)
            }
            
            VStack {

                Text("Rate our app in the AppStore")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    OBUN()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    OBUR()
}
