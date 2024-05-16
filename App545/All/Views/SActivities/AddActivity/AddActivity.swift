//
//  AddActivity.swift
//  App545
//
//  Created by IGOR on 11/05/2024.
//

import SwiftUI

struct AddActivity: View {

    @StateObject var viewModel: ActivitiesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Add")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {

                        Menu(content: {
                            
                            ForEach(viewModel.photosForAdd, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 90, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 150)
                                
                            } else {
                                
                                Image(viewModel.currentPhoto)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                            }
                        })
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.actName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.actName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.actDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.actDescription)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(Color.gray))
                        .padding(1)
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.actName = ""
                                viewModel.actDescription = ""
                                viewModel.currentPhoto = ""

                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(RoundedRectangle(cornerRadius: 0).stroke(Color("primary")))
                            })
                            
                            Button(action: {
                                
                                viewModel.actPhoto = viewModel.currentPhoto
                                
                                viewModel.addActivity()
                                
                                viewModel.actName = ""
                                viewModel.actDescription = ""
                                
                                viewModel.fetchActivities()
                                
                                viewModel.currentPhoto = ""

                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                               
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 60)
                                    .background(RoundedRectangle(cornerRadius: 0).fill(viewModel.currentPhoto.isEmpty || viewModel.actName.isEmpty || viewModel.actDescription.isEmpty ? Color.gray.opacity(0.6) : Color("primary")))
                            })
                            .disabled(viewModel.currentPhoto.isEmpty || viewModel.actName.isEmpty || viewModel.actDescription.isEmpty ? true : false)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddActivity(viewModel: ActivitiesViewModel())
}
