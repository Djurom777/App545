//
//  GoalsView.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = GoalsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Your goals")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                       Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                    })
                }
                
                HStack {
                    
                    ForEach(viewModel.Types, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.currentType == index ? .white : .black)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Rectangle().fill(viewModel.currentType == index ? Color("primary") : .gray.opacity(0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Rectangle().fill(.gray.opacity(0.5)))
                
                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        Text("This should be your goal")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Get one step closer to your goal.")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                        
                        Image("kubok")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Create a goal")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color("primary"))
                        })
                    }
                    .padding()
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.goals, id: \.self) { index in
                            
                                VStack(spacing: 15) {
                                    
                                    Text(index.goalName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    Text(index.goalDescription ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    HStack {
                                        
                                        Text((index.goalSDate ?? Date()).convertDate(format: "YY MM"))
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(width: 25, height: 60)
                                            .background(Rectangle().fill(Color.gray.opacity(0.5)))
                                        
                                        Spacer()
                                        
                                        Text((index.goalSDate ?? Date()).convertDate(format: "YY MM"))
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(width: 25, height: 60)
                                            .background(Rectangle().fill(Color.gray.opacity(0.5)))
                                    }
                                    
                                        Button(action: {
                                            
                                            viewModel.isReady.toggle()
                                            
                                        }, label: {
                                            
                                            HStack {
                                                
                                                ZStack {
                                                    
                                                    Circle()
                                                        .stroke(.black)
                                                        .frame(width: 15)
                                                    
                                                    Image(systemName: "checkmark")
                                                        .foregroundColor(.green)
                                                        .font(.system(size: 10, weight: .regular))
                                                        .opacity(viewModel.isReady ? 1 : 0)
                                                }
                                                
                                                Text(index.goalItem ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Spacer()
                                            }
                                        })
                                }
                                .padding()
                                .shadow(color: .gray, radius: 5, x: 2, y: -4)
                            }
                        }
                    }
                }

            }
            .padding()
        }
    }
}

#Preview {
    GoalsView()
}
