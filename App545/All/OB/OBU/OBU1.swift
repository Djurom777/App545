//
//  OBU1.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct OBU1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("UOB1")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 80)
            }
            
            VStack {

                
                Spacer()
                
                NavigationLink(destination: {
                    
                    OBUR()
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
    }
}

#Preview {
    OBU1()
}
