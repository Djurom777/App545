//
//  OBR2.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct OBR2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("ROB2")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 80)
            }
            
            VStack {
                
                Text("Convenient functionality and ease of learning")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal, 30)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    }
}

#Preview {
    OBR2()
}
