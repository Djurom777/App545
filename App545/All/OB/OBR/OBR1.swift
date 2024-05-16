//
//  OBR1.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct OBR1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("ROB1")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.bottom, 80)
            }
            
            VStack {
                
                Text("The ability to edit and delete a record at any time")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    OBR2()
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
    OBR1()
}
