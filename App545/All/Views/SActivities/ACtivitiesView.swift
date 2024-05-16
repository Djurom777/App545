//
//  ACtivitiesView.swift
//  App545
//
//  Created by IGOR on 02/05/2024.
//

import SwiftUI

struct ACtivitiesView: View {
    
    @StateObject var viewModel = ActivitiesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Sports activities")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                    })
                }
                .padding(.bottom, 30)
                
                if viewModel.activities.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image("ball")
                        
                        Text("Add a sports activity")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("Get one step closer to your goal.")
                            .foregroundColor(.gray.opacity(0.6))
                            .font(.system(size: 16, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(RoundedRectangle(cornerRadius: 0).stroke(Color("primary")))
                                .padding(1)
                            
                        })
                        .padding()
                    }
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.activities, id: \.self) { index in
                            
                                VStack(spacing: 12) {
                                    
                                    Image(index.actPhoto ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                    
                                    Text(index.actName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .medium))
                                        
                                    Text(index.actDescription ?? "")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedActivity = index
                                        
                                        viewModel.selectedPage = viewModel.selectedActivity?.actName ?? ""
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        Text("Details")
                                            .foregroundColor(.red)
                                            .font(.system(size: 18, weight: .regular))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 60)
                                            .background(RoundedRectangle(cornerRadius: 0).stroke(Color("primary")))
                                            .padding(1)
                                        
                                    })
                                    .padding(.top)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddActivity(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ActDetail(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchActivities()
        }
    }
}

#Preview {
    ACtivitiesView()
}
