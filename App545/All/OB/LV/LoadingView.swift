//
//  LoadingView.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("logoex")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(80)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 200)
            }
        }
    }
}

#Preview {
    LoadingView()
}
