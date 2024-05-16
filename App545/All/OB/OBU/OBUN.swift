//
//  OBUN.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct OBUN: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("UOBN")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 80)
            }
            
            VStack {
                
                Text("Don’t miss anything")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal, 30)
                
                Spacer()
                
                Button(action: {
                    
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 0).fill(Color("primary")))
                        .padding()
                })
            }
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .padding(6)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    OBUN()
}
